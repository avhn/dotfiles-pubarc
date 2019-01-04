(package-initialize)

(add-hook 'emacs-startup-hook (lambda ()
								(setq-default ns-pop-up-frames nil
											  column-number-mode t
											  tab-width 4
											  default-directory "~/"
											  )
				
								(define-key global-map [remap list-buffers] 'buffer-menu-other-window)
								(tool-bar-mode -1)
								(scroll-bar-mode -1)
								(when window-system (set-frame-size (selected-frame) 91 65))
								(load-theme 'adwaita)
								))


(add-hook 'python-mode-hook (lambda ()
							  (setq indent-tabs-mode nil
									python-indent 4
									elpy-rpc-python-command "~/.emacs.d/py3venv/bin/python3"
									)
			      
							  (when window-system (set-frame-size (selected-frame) 162 65))
							  (split-window-right)
							  (elpy-enable)
							  ))


(add-hook 'c-mode-hook (setq c-default-style 'linux
							 c-basic-offset 2
							 indent-tabs-mode nil))


(add-hook 'makefile-mode-hook (setq indent-tabs-mode t))


(add-hook 'latex-mode-hook (setq indent-tabs-mode t
								 LaTeX-indent-level 4
								 LaTeX-item-indent 2))
