Consider this folder as in `$HOME/.gnupg`

Use `version >= <b>gpg2.1</b>`.

## Setting up for SSH

Add authentication subkey and put keygrip in `$HOME/.gnupg/sshcontrol`:

```bash
$ gpg -K --with-keygrip
$ echo $keygrip > $HOME/.gnupg/sshcontrol
```

Enable ssh support:

```bash
$ echo "enable-ssh-support" > $HOME/.gnupg/gpg-agent.conf
```

Append to startup shell profile:

```bash
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye
```

## Signing commits

Set git config:

```bash
$ gpg --list-secret-keys --keyid-format LONG
$ git config --global user.signingkey $signingkey
$ git config --global commit.gpgsign true
$ git config --global gpg.program $(which gpg)
```
