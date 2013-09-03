;; (setq load-path
;;       (cons "~/.emacs.d/site-lisp/haskell-mode" load-path))
;; ハスケル用
;; (load "haskell-site-file")
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;; (add-hook 'haskell-mode-hook 'font-lock-mode)
;; (add-hook 'haskell-mode-hook 'imenu-add-menubar-index)
;; (setq haskell-program-name "/usr/local/bin/ghci")
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
