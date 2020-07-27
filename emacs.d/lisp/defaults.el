;; use utf-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq-default ns-pop-up-frames nil
      column-number-mode t
      indent-tabs-mode nil
      tab-width 4
      default-directory "~/"
      preferred-font "Fira Code Retina")

;; set font
(when (member preferred-font (font-family-list))
  (set-default-font preferred-font))

;; set ui
(when (display-graphic-p)
      (tool-bar-mode -1)
      (menu-bar-mode -1)
      (scroll-bar-mode -1))
;; both terminal and ui theme
(load-theme 'manoj-dark t)
