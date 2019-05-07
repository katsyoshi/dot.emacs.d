;; .emacs.d/init.el
;; set font and background color
(set-background-color "#282a36")
(set-foreground-color "#f8f8f2")
(set-cursor-color "#ccccc7")
;; バックスペース
(global-set-key (kbd "C-h") 'delete-backward-char)
;; ヘルプ
(global-set-key (kbd "C-c h") 'help)
;; ウィンドウ移動
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <right>") 'windmove-right)
;; set key maps
(global-set-key (kbd "C-c C-a") 'align-regexp)
(global-set-key (kbd "C-c C-r") 'revert-buffer)
(setq-default indent-tabs-mode nil)
;; load font
(load "~/.emacs.d/settings/font.el")
;; いんすとーるぱっけーじもーで
(load "~/.emacs.d/settings/package.el")

;; set switch buffer keybind
(global-set-key (kbd "C-x C-b") 'switch-to-buffer)
;; Load PATH
;; (let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
;;  (add-to-list 'load-path default-directory)
;;  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;;      (normal-top-level-add-subdirs-to-load-path)))
;; パス設定
(exec-path-from-shell-initialize)

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

;; ivy設定
(load "~/.emacs.d/settings/ivy.el")

;; emacs daemons
(require 'server)
(unless (server-running-p)
  (server-start))

;; ウインドウのサイズとツールバーの表示
(if window-system
    (progn
      (tool-bar-mode 0)
      ;; 画像表示
      (auto-image-file-mode t)
      (auto-compression-mode t)))

;; flycheck
(require 'flycheck)

;; neotree
(require 'neotree)
(setq neo-theme (if (display-graphic-p) 'nerd))
(global-set-key (kbd "C-o") 'neotree-toggle)

;; rectangle mark
(global-set-key (kbd "C-<return>") 'rectangle-mark-mode)

;; ;; backup
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.bak"))
            backup-directory-alist))

(load "~/.emacs.d/settings/all-the-icons.el")
(load "~/.emacs.d/settings/company.el")
(load "~/.emacs.d/settings/doom.el")
(load "~/.emacs.d/settings/git.el")
(load "~/.emacs.d/settings/lsp.el")
(load "~/.emacs.d/settings/markdown.el")
(load "~/.emacs.d/settings/sass.el")
(load "~/.emacs.d/settings/skk.el")
(load "~/.emacs.d/settings/yaml.el")

;; LSP
(load "~/.emacs.d/settings/lsp/clang.el")
(load "~/.emacs.d/settings/lsp/dockerfile.el")
(load "~/.emacs.d/settings/lsp/go.el")
(load "~/.emacs.d/settings/lsp/javascript.el")
(load "~/.emacs.d/settings/lsp/python.el")
(load "~/.emacs.d/settings/lsp/ruby.el")
(load "~/.emacs.d/settings/lsp/rust.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (go-mode yaml-mode rust-mode neotree minimap magit lua-mode lsp-ui js2-mode ivy-rich hydra hide-mode-line flycheck fill-column-indicator exec-path-from-shell doom-themes doom-modeline doom dockerfile-mode ddskk counsel company-lsp company-box ccls all-the-icons-ivy ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
