#!/bin/sh
# Installs the latest Relay into /Applications:
#   curl -fsSL https://raw.githubusercontent.com/alenkpedro/relay/main/install.sh | sh
#
# Picks the build for this Mac (Apple silicon or Intel), checks it against the SHA-256 that
# GitHub publishes for the release, and opens it. Relay updates itself after that.
set -eu

REPO=alenkpedro/relay
BUNDLE_ID=dev.relay.desktop
DEST_DIR=${RELAY_INSTALL_DIR:-/Applications}

say() { printf '\033[1m==>\033[0m %s\n' "$1"; }
fail() { printf '\033[31mError:\033[0m %s\n' "$1" >&2; exit 1; }

[ "$(uname -s)" = Darwin ] || fail "Relay is for macOS."

# Apple silicon, even when this shell runs under Rosetta.
if [ "$(uname -m)" = arm64 ] || [ "$(sysctl -n sysctl.proc_translated 2>/dev/null || echo 0)" = 1 ]; then
  ARCH=arm64
else
  ARCH=x64
fi

say "Finding the latest Relay for $( [ "$ARCH" = arm64 ] && echo 'Apple silicon' || echo 'Intel' )…"
JSON=$(curl -fsSL -H 'Accept: application/vnd.github+json' "https://api.github.com/repos/$REPO/releases/latest") \
  || fail "Couldn't reach GitHub."

# Read the release with JavaScript for Automation, which every Mac has (no jq or Python needed).
INFO=$(printf '%s' "$JSON" | osascript -l JavaScript -e '
  function run() {
    const data = $.NSFileHandle.fileHandleWithStandardInput.readDataToEndOfFile;
    const rel = JSON.parse($.NSString.alloc.initWithDataEncoding(data, $.NSUTF8StringEncoding).js);
    const a = (rel.assets || []).find((x) => x.name.endsWith("-'"$ARCH"'-mac.zip"));
    if (!a) return "";
    return [rel.tag_name.replace(/^v/, ""), a.browser_download_url, (a.digest || "").replace(/^sha256:/, "")].join(" ");
  }') || fail "Couldn't read the release from GitHub."
[ -n "$INFO" ] || fail "The latest release has no download for this Mac."
set -- $INFO
VERSION=$1 URL=$2 SUM=${3:-}
[ -n "$SUM" ] || fail "Relay $VERSION has no checksum on GitHub, so it wasn't installed."

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

say "Downloading Relay $VERSION…"
curl -fL --progress-bar -o "$TMP/Relay.zip" "$URL" || fail "The download failed."
[ "$(shasum -a 256 "$TMP/Relay.zip" | cut -d' ' -f1)" = "$SUM" ] || fail "The download was corrupted (checksum mismatch). Try again."

ditto -x -k "$TMP/Relay.zip" "$TMP/app"
APP="$TMP/app/Relay.app"
[ "$(plutil -extract CFBundleIdentifier raw "$APP/Contents/Info.plist" 2>/dev/null)" = "$BUNDLE_ID" ] \
  || fail "The download isn't the expected Relay app."

if [ "$DEST_DIR" = /Applications ] && pgrep -xq Relay; then
  say "Quitting Relay…"
  osascript -e 'quit app "Relay"' >/dev/null 2>&1 || true
  for _ in 1 2 3 4 5 6 7 8 9 10; do pgrep -xq Relay || break; sleep 1; done
fi

say "Installing into $DEST_DIR…"
mkdir -p "$DEST_DIR"
SUDO=
[ -w "$DEST_DIR" ] || SUDO=sudo
$SUDO rm -rf "${DEST_DIR:?}/Relay.app"
$SUDO ditto "$APP" "$DEST_DIR/Relay.app"
$SUDO xattr -dr com.apple.quarantine "$DEST_DIR/Relay.app" 2>/dev/null || true

say "Relay $VERSION is installed."
[ -n "${RELAY_NO_OPEN:-}" ] || open "$DEST_DIR/Relay.app"
