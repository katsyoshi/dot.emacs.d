;; .emacs.d/init.el
;; set font and background color
(set-background-color "black")
(set-foreground-color "white")
;; バックスペース
(global-set-key (kbd "C-h") 'delete-backward-char)
;; ヘルプ
(global-set-key (kbd "C-c h") 'help)
;; jump
(global-set-key (kbd "C-x j") 'goto-line)
;; パス設定
(load "~/.emacs.d/settings/mac.el") ;; Exec-path
;; バッファリスト
(global-set-key (kbd "C-x C-b") 'buffer-menu)
;; Load PATH
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
 (add-to-list 'load-path default-directory)
 (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
     (normal-top-level-add-subdirs-to-load-path)))

;; whitespace
(setq-default show-trailing-whitespace t)
(setq whitespace-style
      '(tabs tab-mark spaces space-mark))
(setq whitespace-space-regexp "\\(\x3000+\\)")
(setq whitespace-display-mappings
      '((space-mark ?\x3000 [?\□])
        (tab-mark   ?\t   [?\xBB ?\t])
        ))
(require 'whitespace)
(global-whitespace-mode 1)
(set-face-foreground 'whitespace-space "LightSlateGray")
(set-face-background 'whitespace-space "DarkSlateGray")
(set-face-foreground 'whitespace-tab "LightSlateGray")
(set-face-background 'whitespace-tab "DarkSlateGray")

;; default settings
;; デフォルトの設定
;; Japanese
;; 日本語
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
;; Cursor
;; カーソルの色
(set-cursor-color "light blue")
;; clipboard
;; クリップコード
(setq x-select-enable-clipboard t)
;; batch files
(require 'generic-x)
;; yspel
(require 'yspel)
;; anything
;; (require 'anything-startup)
;; helm
(require 'helm-config)
(helm-mode 1)

;; ;; (require 'jaspace)
;; shell
;; (setq system-uses-terminfo nil)
;; (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; (require 'multi-term)
;; (require 'zlc)

;; emacs daemons
(require 'server)
(unless (server-running-p)
  (server-start))


;; ウインドウのサイズとツールバーの表示
(if window-system
    (progn
      (setq initial-frame-alist
            (append (list
                     '(width . 80)
                     '(height . 80))
                    initial-frame-alist))
      ;; alpha
      (set-frame-parameter (selected-frame) 'alpha '(90 90))
      ;; tool-bar表示オフ
      (tool-bar-mode 0)
      ;; fullscreen
      (if ns-use-native-fullscreen
          (progn
             (global-set-key [(meta return)] 'toggle-frame-fullscreen)))
      ;; Cacoo
      ;;(load "~/.emacs.d/settings/cacoo.el")
      ;; 画像表示
      (auto-image-file-mode t)
      (auto-compression-mode t)))
      ;; window分割
      ;;(load "~/.emacs.d/settings/window.el")))

(require 'flycheck)
;; 矩形選択
(cua-mode t)
(setq cua-enable-cua-keys nil)
(global-set-key (kbd "C-c C-]") 'cua-set-rectangle-mark)
;; yspel.el
(require 'yspel)

;; ;; backup
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.bak"))
            backup-directory-alist))
(load "~/.emacs.d/settings/skk.el") ;; SKK
(load "~/.emacs.d/settings/fonts23.el") ;; font settings
(load "~/.emacs.d/settings/ruby.el") ;; Ruby
(load "~/.emacs.d/settings/yatex.el");; YaTeX
(load "~/.emacs.d/settings/clang.el");; C Lang
(load "~/.emacs.d/settings/yaml.el") ;; Yaml
(load "~/.emacs.d/settings/complete.el");;auto-complete
(load "~/.emacs.d/settings/javascript.el") ;; javascript
(load "~/.emacs.d/settings/markdown.el");;markdown
(load "~/.emacs.d/settings/rails.el");;rails
(load "~/.emacs.d/settings/github.el");;github
(load "~/.emacs.d/settings/haskell.el");
(require 'w3m-load)
