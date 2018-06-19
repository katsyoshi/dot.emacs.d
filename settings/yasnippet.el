(add-to-list 'load-path
              "~/.emacs.d/site-lisp/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(require 'helm-c-yasnippet)
(setq anything-c-yas-space-match-any-greedy t)
(global-set-key (kbd "C-c y") 'yas/insert-snippet)

(setq yas/snippet-dirs '("~/.emacs.d/share/snippets"
                         "~/.emacs.d/site-lisp/yasnippet/extras/imported"))
(yas/global-mode 1)
