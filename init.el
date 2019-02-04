;; .emacs.d/init.el
;; set font and background color
(set-background-color "#98bc98")
(set-foreground-color "black")
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
(global-set key (kbd "C-x C-b") 'switch-to-buffer)
(global-set-key (kbd "C-c C-a") 'align-regexp)
(global-set-key (kbd "C-c C-r") 'revert-buffer)
(setq-default indent-tabs-mode nil)
;; いんすとーるぱっけーじもーで
(load "~/.emacs.d/settings/package.el")

;; Load PATH
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
 (add-to-list 'load-path default-directory)
 (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
     (normal-top-level-add-subdirs-to-load-path)))
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

;; バッファリスト
(load "~/.emacs.d/settings/ivy.el")

;; emacs daemons
(require 'server)
(unless (server-running-p)
  (server-start))

;; flycheck
(require 'flycheck)

;; neotree
(require 'neotree)
(global-set-key (kbd "C-o") 'neotree-toggle)

;; 矩形選択
(cua-mode t)
(setq cua-enable-cua-keys nil)
(global-set-key (kbd "C-c C-]") 'cua-set-rectangle-mark)

;; ;; backup
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.bak"))
            backup-directory-alist))

(load "~/.emacs.d/settings/all-the-icons.el")
(load "~/.emacs.d/settings/company.el")
(load "~/.emacs.d/settings/git.el")
(load "~/.emacs.d/settings/lsp.el")
(load "~/.emacs.d/settings/markdown.el")
(load "~/.emacs.d/settings/skk.el")
(load "~/.emacs.d/settings/yaml.el")
