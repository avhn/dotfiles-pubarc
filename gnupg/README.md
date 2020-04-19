Consider this file as in `$HOME/.gnupg`

## Setting up GPG for SSH

Add authentication subkey and put keygrip in `[$HOME/.gnupg/sshcontrol](./sshcontrol)`:

```bash
$ gpg -K --with-keygrip
$ echo $keygrip > $HOME/.gnupg/sshcontrol
```

Enable ssh support:

```bash
$ echo "enable-ssh-support" > $HOME/.gnupg/gpg-agent.conf
```

Add startup to shell profile:

```bash
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
gpgconf --launch gpg-agent
```
