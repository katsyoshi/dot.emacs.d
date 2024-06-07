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
(load "~/.emacs.d/settings/load-path.el")

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
(setq select-enable-clipboard t)

;; consult設定
(load "~/.emacs.d/settings/ivy.el")
(load "~/.emacs.d/settings/vertico.el")
;; migemo 設定
(load "~/.emacs.d/settings/migemo.el")

;; ウインドウのサイズとツールバーの表示
(tool-bar-mode 0)
(menu-bar-mode 0)
;; 画像表示
(auto-image-file-mode t)
(auto-compression-mode t)

;; server settings
(load "~/.emacs.d/settings/server.el")
;; flycheck
(require 'flycheck)
(pixel-scroll-mode 1)

;; rectangle mark
(global-set-key (kbd "C-<return>") 'rectangle-mark-mode)

;; ;; backup
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.bak"))
            backup-directory-alist))
;; load doom
(load "~/.emacs.d/settings/doom.el")
;; load theme
(load-theme 'material t)

(load "~/.emacs.d/settings/treesitter.el")
(load "~/.emacs.d/settings/company.el")
(load "~/.emacs.d/settings/git.el")
(load "~/.emacs.d/settings/java.el")
(load "~/.emacs.d/settings/markdown.el")
(load "~/.emacs.d/settings/multi-cursors.el")
(load "~/.emacs.d/settings/neotree.el")
(load "~/.emacs.d/settings/ruby.el")
(load "~/.emacs.d/settings/sass.el")
(load "~/.emacs.d/settings/sh.el")
(load "~/.emacs.d/settings/skk.el")
(load "~/.emacs.d/settings/undo-tree.el")
(load "~/.emacs.d/settings/yaml.el")
(load "~/.emacs.d/settings/yasnippet.el")
(load "~/.emacs.d/settings/web.el")

;; LSP
;; (load "~/.emacs.d/settings/lsp.el")
(load "~/.emacs.d/settings/eglot.el")
;; (load "~/.emacs.d/settings/copilot.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(region-bindings-mode lsp-mode web-mode graphviz-dot-mode eglot tree-sitter-langs tree-sitter lsp-origami origami rjsx-mode graphql-mode typescript-mode go-mode yaml-mode rust-mode neotree minimap magit lua-mode lsp-ui js2-mode ivy-rich hydra hide-mode-line flycheck fill-column-indicator exec-path-from-shell doom-themes doom-modeline doom dockerfile-mode ddskk counsel company-lsp company-box ccls all-the-icons-ivy ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doom-modeline-bar ((t (:background "#6272a4")))))
(put 'set-goal-column 'disabled nil)
