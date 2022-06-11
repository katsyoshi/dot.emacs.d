(setq lsp-keymap-prefix (kbd "C-c l"))
(require 'lsp-mode)
(require 'lsp-ui)

;; company box
(require 'company-box)
(add-hook 'company-mode-hook 'company-box-mode)

;; company lsp
(require 'company-lsp)
(push 'company-lsp company-backends)

(setq lsp-completion-provider :capf)
