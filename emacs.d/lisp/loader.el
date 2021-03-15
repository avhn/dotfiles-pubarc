(eval-when-compile
  (unless (require 'use-package nil t)
    (package-refresh-contents)
    (package-install 'use-package)
    (require 'use-package)))

;; use $PATH from shell for macOS gui
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package lsp-mode
  :ensure t)

;; provides fancier overlays.
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

;; company-lsp integrates company mode completion with lsp-mode.
;; completion-at-point also works out of the box but doesn't support snippets.
;; company-lsp delisted from melpa, load from path
(use-package company-lsp
  :load-path "lisp/company-lsp"
  :commands company-lsp)
(require 'company-lsp)

;; provides snippet support.
(use-package yasnippet
  :ensure t
  :commands yas-minor-mode
  :hook (go-mode . yas-minor-mode))

;; modes
;; set up before-save hooks to format buffer and add/delete imports.
;; make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(use-package go-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred))

(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . lsp))

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init
  ;;; use pandoc
  (setq markdown-command "pandoc")
  (auto-fill-mode)
  (setq fill-column 90))

;;; bindings

(define-key global-map [remap list-buffers] 'buffer-menu-other-window)

;;; hooks

(add-hook 'emacs-lisp-mode-hook
          (lambda()
            (company-mode)))

(add-hook 'makefile-mode-hook
          (lambda()
            (setq indent-tabs-mode t)))

(add-hook 'c-mode-hook
          (lambda()
            (setq c-default-style "linux"
                  c-basic-offset 2)))

(add-hook 'latex-mode-hook
          (lambda()
            (setq LaTeX-indent-level 4
                  LaTeX-item-indent 2)))

;; custom file

(setq custom-file "~/.emacs.d/lisp/custom.el")
(load custom-file)
(load "defaults")

