(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.\\(js\\|json\\)$" . js2-mode))
(add-hook 'js2-mode-hook
          (require 'js)
          (setq js-indent-level 2)
          (setq indent-tabs-mode nil))
