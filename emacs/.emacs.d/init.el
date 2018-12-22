(package-initialize)

(add-hook 'emacs-startup-hook (lambda ()
				(setq ns-pop-up-frames nil)				
				(tool-bar-mode -1)
				(scroll-bar-mode -1)
				(when window-system (set-frame-size (selected-frame) 91 65))
				(setq column-number-mode t)
				(setq indent-tabs-mode nil)
				(setq tab-width 4)
				(setq default-directory "~/")
				(load-theme 'adwaita)
				(define-key global-map [remap list-buffers] 'buffer-menu-other-window)))


(setq python-shell-interpreter "python3")
(add-hook 'python-mode-hook (lambda ()
			      (setq-default python-indent 4)
			      (elpy-enable)
			      (when window-system (set-frame-size (selected-frame) 160 65))
			      (split-window-right)))


