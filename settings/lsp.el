;; -*- lexical-binding: t -*-
(when (require 'lsp-mode nil 'noerror)
  (when (require 'lsp-ui nil 'noerror)
    (add-hook 'lsp-mode-hook #'lsp-ui-mode))

  ;; company integration
  (when (require 'company nil 'noerror)
    (company-mode 1)
    (when (require 'company-box nil 'noerror)
      (add-hook 'company-mode-hook #'company-box-mode)))

  (setq lsp-prefer-capf t)

  ;; load lsp configuration modules when present
  (dolist (module '("settings/lsp/ruby"
                    "settings/lsp/rust"
                    "settings/lsp/yaml"
                    "settings/lsp/web"))
    (let ((path (expand-file-name module user-emacs-directory)))
      (when (file-readable-p (concat path ".el"))
        (load path nil 'nomessage)))))
