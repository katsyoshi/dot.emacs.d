(require 'yasnippet)
(global-set-key (kbd "C-c y") 'yas-insert-snippet)

(setq yas/snippet-dirs
      '("~/.emacs.d/share/snippets"))
(yas/global-mode 1)
