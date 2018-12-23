(package-initialize)

(add-hook 'emacs-startup-hook (lambda ()
				(setq ns-pop-up-frames nil
				      column-number-mode t
				      indent-tabs-mode nil
				      tab-width 4
				      default-directory "~/")
				(define-key global-map [remap list-buffers] 'buffer-menu-other-window)

			        (tool-bar-mode -1)
				(scroll-bar-mode -1)
				(when window-system (set-frame-size (selected-frame) 91 65))
				(load-theme 'adwaita)))



(setq python-shell-interpreter "python3")
(add-hook 'python-mode-hook (lambda ()
			      (setq python-indent 4)
			      (when window-system (set-frame-size (selected-frame) 162 65))
			      (split-window-right)
			      (elpy-enable)))

(add-hook 'c-mode-hook (lambda ()
			 (setq c-default-style 'linux
			       c-basic-offset 2)))


(add-hook 'makefile-mode-hook (lambda()
				(setq indent-tabs-mode t)))
