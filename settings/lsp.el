(require 'lsp-mode)
(require 'lsp-ui)

(add-hook 'lsp-mode-hook 'lsp-ui-mode)

;; company
(require 'company-mode)
(company-mode 1)

;; company box
(require 'company-box)
(add-hook 'company-mode-hook 'company-box-mode)

(setq lsp-prefer-capf t)

;; load lsp configuration
(load "~/.emacs.d/settings/lsp/ruby.el")
(load "~/.emacs.d/settings/lsp/rust.el")
(load "~/.emacs.d/settings/lsp/yaml.el")
(load "~/.emacs.d/settings/lsp/web.el")
