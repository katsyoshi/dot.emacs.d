(autoload 'enh-ruby-mode "enh-ruby-mode" "Mode for editing ruby source files")
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.cgi$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspsec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.schema" . enh-ruby-mode))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys
  "inf-ruby" "Set local key defs for inf-ruby in enh-ruby-mode")

;; flycheck ruby rubocop
(add-hook 'enh-ruby-mode-hook
          #'(lambda ()
             (setq flycheck-checker 'ruby-lint)
             (flycheck-mode 1)))

(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))
(setq ruby-insert-encoding-magic-comment nil)

(add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
