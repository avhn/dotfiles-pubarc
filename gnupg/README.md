Consider this folder as `$HOME/.gnupg`

Use version >= <b>gpg2.1</b>.

## Set up for SSH

Add authentication subkey and put keygrip in `$HOME/.gnupg/sshcontrol`:

```zsh
$ gpg -K --with-keygrip
$ echo $keygrip > $HOME/.gnupg/sshcontrol
```

Enable ssh support:

```zsh
$ echo "enable-ssh-support" > $HOME/.gnupg/gpg-agent.conf
```

Append to startup shell profile:

```zsh
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
export GPG_TTY=$(tty)
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye
```

## Sign commits

Set git config:

```zsh
$ gpg --list-secret-keys --keyid-format LONG
$ git config --global user.signingkey $signingkeyid
$ git config --global commit.gpgsign true
$ git config --global gpg.program $(which gpg)
```

## Remove master key

Be careful of deleting subkeys. Stop after first confirmation.
```zsh
$ gpg --list-secret-keys --keyid-format LONG
$ gpg --delete-secret-key $masterkeyid
```

Confirm, deleted private keys will have "#" sign before them.
```zsh
$ gpg --list-secret-keys
```
