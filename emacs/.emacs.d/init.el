(package-initialize)

(add-hook 'emacs-startup-hook (lambda ()
  (setq-default ns-pop-up-frames nil
			    column-number-mode t
				tab-width 4
				default-directory "~/"
				python-shell-interpreter "python3"
				python-shell-interpreter-args "-i")

  (set-default-font "Source Code Pro")
  
  ;;  if macOS-gui, initialize exec-path-from-shell
  (if (eq system-type 'darwin)
      (when (memq window-system '(mac ns x))
        (setq exec-path-from-shell-arguments nil)
        (exec-path-from-shell-initialize)))

  (define-key global-map [remap list-buffers] 'buffer-menu-other-window)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (load-theme (if window-system 'deeper-blue 'manoj-dark) t)
  ))


(add-hook 'python-mode-hook (lambda ()
  (setq indent-tabs-mode nil
		python-indent 4)

  ;; use virtualenv for elpy packages
  (setq elpy-rpc-python-command "~/.emacs.d/py3venv/bin/python3.7")
  (elpy-enable)
  ))


(add-hook 'c-mode-hook (lambda()
  (setq c-default-style "linux"
		c-basic-offset 2
		indent-tabs-mode nil)
  ))

(add-hook 'latex-mode-hook (lambda()
  (setq indent-tabs-mode t
		LaTeX-indent-level 4
		LaTeX-item-indent 2)
  ))

(add-hook 'makefile-mode-hook (lambda()
  (setq indent-tabs-mode t)))

(add-hook 'emacs-lisp-mode-hook (lambda()
  (setq indent-tabs-mode nil)))
