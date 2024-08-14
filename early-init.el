(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(load "~/.emacs.d/settings/font.el")
;; いんすとーるぱっけーじもーで
(load "~/.emacs.d/settings/package.el")

;; Load PATH
(load "~/.emacs.d/settings/load-path.el")

;; パス設定
(exec-path-from-shell-initialize)
;; consult設定
(load "~/.emacs.d/settings/ivy.el")
(load "~/.emacs.d/settings/vertico.el")
;; migemo 設定
(load "~/.emacs.d/settings/migemo.el")

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
(global-set-key (kbd "C-x C-b") 'switch-to-buffer)
(setq-default indent-tabs-mode nil)
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
(setq select-enable-clipboard t)

;; server settings
(load "~/.emacs.d/settings/server.el")

;; 画像表示
(auto-image-file-mode t)
(auto-compression-mode t)
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
(load-theme 'wombat t)

;; load treesitter settings
(load "~/.emacs.d/settings/treesitter.el")

(load "~/.emacs.d/settings/company.el")
(load "~/.emacs.d/settings/markdown.el")
(load "~/.emacs.d/settings/skk.el")
(load "~/.emacs.d/settings/undo-tree.el")
(load "~/.emacs.d/settings/yasnippet.el")
(load "~/.emacs.d/settings/ellama.el")

;; LSP
;; (load "~/.emacs.d/settings/lsp.el")
(load "~/.emacs.d/settings/eglot.el")
;; (load "~/.emacs.d/settings/copilot.el")
