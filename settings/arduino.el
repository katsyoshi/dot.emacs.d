(load "~/.emacs.d/site-lisp/arduino-mode.el")
(require 'arduino-mode)
(autoload 'arduino-mode "arduino-mode" "Mode for editing arduino source files")
(add-to-list 'auto-mode-alist '("\\.ino$" . arduino-mode))
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq indent-tab-mode nil)
            (c-set-style "gnu")))
