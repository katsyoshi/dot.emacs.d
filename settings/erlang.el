;; (setq load-path 
;;       (cons "~/.emacs.d/site-lisp/erlang-mode/" load-path))
(cond ((string-match "darwin" system-configuration)
       (setq erlang-root-dir "/opt/local/lib/erlang")
       (setq erlang-path "/opt/local/lib/erlang/bin" exec-path))
      ((string-match "freebsd" system-configuration)
       (setq erlang-root-dir "/usr/local/lib/erlang")
       (setq erlang-path "/usr/local/lib/erlang/bin" exec-path)))
(require 'erlang-start)
