(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-refresh-contents)

(package-install 'exec-path-from-shell)
(package-install 'elpy)

(save-buffers-kill-emacs)
