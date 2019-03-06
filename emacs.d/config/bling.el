;;; Dracula theme
(use-package dracula-theme
  :init (progn (load-theme 'dracula t))
  :ensure t)

;;; Remove window tool bars, menus and scroll bars
(when (window-system)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (menu-bar-mode -1))

;;; Prevents window splitting
(setq pop-up-windows nil)


;;; Update the window title bar
(setq frame-title-format
      (list
       (format "%s %%S: %%j " (system-name))
       '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))


;;; Font size keybindings
(defun adjust-default-font-height (delta)
  (let* ((old (face-attribute 'default :height))
         (height (+ (face-attribute 'default :height) delta))
         (points (/ height 10)))
    (set-face-attribute 'default nil :height height)
    (message "default font old %d new %d" old (face-attribute 'default :height))))

(global-set-key (kbd "M-0")
                '(lambda () (interactive) (set-face-attribute 'default nil :height 90)))

(global-set-key (kbd "M-+")
                '(lambda () (interactive) (adjust-default-font-height +5)))

(global-set-key (kbd "M--")
                '(lambda () (interactive) (adjust-default-font-height -5)))


;;; General highlighting
(setq-default show-trailing-whitespace 't)
(setq-default truncate-lines t)
(global-hl-line-mode t)
(show-paren-mode t)
(global-linum-mode t)

;;; Powerline
(use-package powerline
  :config (powerline-default-theme)
  :ensure t)


;;; Font setup. HACK with fallback to Inconsolata
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-face-attribute 'default nil
                    :family "Hack"
                    :weight 'normal
                    :width 'normal
                    :height 90)

(when (functionp 'set-fontset-font)
  (set-fontset-font "fontset-default"
                    'unicode
                    (font-spec :family "Inconsolata"
                               :height 120
                               :weight 'normal
                               :width 'normal)))

(when (functionp 'set-fontset-font)
  (set-fontset-font "fontset-default"
                    'unicode
                    (font-spec :family "DejaVu Sans Mono"
                               :width 'normal
                               :size 12
                               :weight 'normal)
                    nil
                    'append))
