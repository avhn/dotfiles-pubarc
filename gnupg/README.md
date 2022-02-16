Consider this folder as `$HOME/.gnupg`

Use version >= <b>>=2/b>.

## Set up for SSH

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
```

## Sign commits

Set git config:

```bash
$ gpg --list-secret-keys --keyid-format LONG
$ git config --global user.signingkey $signingkeyid
$ git config --global commit.gpgsign true
$ git config --global gpg.program $(which gpg)
```

## Remove master key

Be careful of deleting subkeys. Stop after first confirmation.
```bash
$ gpg --list-secret-keys --keyid-format LONG
$ gpg --delete-secret-key $masterkeyid
```

Confirm, deleted private keys will have "#" sign before them.
```bash
$ gpg --list-secret-keys
```
