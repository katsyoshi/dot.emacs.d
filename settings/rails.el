(add-to-list 'load-path "~/.emacs.d/site-lisp/rinari")
(setq rinari-minor-mode-prefixes (list "'"))
(require 'rinari)

;;; rhtml-mode
;; (require 'rhtml-mode)
;; (add-hook 'rhtml-mode-hook
;;     (lambda () (rinari-launch)))

;; .emacs
(setq rails-tags-dirs '("app" "lib" "test" "db" "vendor"))
(require 'rinari-extend-by-emacs-rails)
(defun ruby-mode-hooks-rinari-extend ()
  (define-key ruby-mode-map (kbd "<C-f1>") 'rails-search-doc)
  (define-key ruby-mode-map [f1] 'rails-search-doc-at-point)
)
(defun rinari-mode-hooks-rinari-extend ()
  (define-key rinari-minor-mode-map "\C-c\C-t" 'rails-create-tags)
)
(add-hook 'ruby-mode-hook 'ruby-mode-hooks-rinari-extend)
(add-hook 'rinari-mode-hook 'rinari-mode-hooks-rinari-extend)