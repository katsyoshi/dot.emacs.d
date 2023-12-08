(add-to-list 'eglot-server-programs '(ruby-ts-mode . ("bundle" "exec" "steep" "langserver")))
(add-hook 'ruby-ts-mode-hook 'eglot-ensure)
