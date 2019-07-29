(require 'yasnippet)
(global-set-key (kbd "C-c y") 'yas/insert-snippet)

(setq yas/snippet-dirs
      '("~/.emacs.d/share/snippets" "~/.emacs.d/site-lisp/yasnippet/extras/imported"))
(yas/global-mode 1)
