<p align="center"><img src="relay-icon.png" width="128" alt=""></p>

<h1 align="center">Relay</h1>

<p align="center">Uma caixa de entrada local para WhatsApp, Telegram, Signal, Discord, Instagram e mais.</p>

<p align="center"><a href="https://github.com/alenkpedro/relay-releases/releases/latest"><b>Baixar a versão mais recente</b></a> · macOS com chip Apple</p>

## Instalação

1. Baixe o `Relay-<versão>-arm64.dmg` da [última versão](https://github.com/alenkpedro/relay-releases/releases/latest).
2. Abra o `.dmg` e arraste o Relay para **Aplicativos**.
3. Se o macOS não deixar abrir na primeira vez: **Ajustes do Sistema → Privacidade e Segurança → Abrir Mesmo Assim**.

Depois disso, o Relay se atualiza sozinho.

## Sobre este repositório

Aqui ficam só os instaladores do Relay. O código do app não é público.

`whatsapp-sync-login.patch` é uma modificação do [mautrix-whatsapp](https://github.com/mautrix/whatsapp), que o Relay aplica ao montar o bridge do WhatsApp no seu Mac. Ela é distribuída sob a **AGPL-3.0**, a mesma licença do mautrix-whatsapp. Cada release também traz a versão do patch usada nela.

As versões até a 0.5.0 foram publicadas sob a licença MIT.
