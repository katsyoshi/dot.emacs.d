(cond ((string-match "darwin" system-configuration)
       (dolist (dir (list "/sbin" "/usr/sbin" "/bin" "/usr/bin"
                          "/sw/bin" "/usr/local/bin" "/opt/local/bin/"
                          "~/.cabal/bin" ))
         ;;  "~/.gentoo/bin" "~/.gentoo/usr/bin" "~/.gentoo/usr/local/bin"))
         ;; PATH と exec-path に同じ物を追加します
         (when (and (file-exists-p dir) (not (member dir exec-path)))
           (setenv "PATH" (concat dir ":" (getenv "PATH")))
           (setq exec-path (append (list dir) exec-path)))
         ;; キーボードの設定(4HHK&Mac)
         (setq ns-command-modifier (quote meta))
         (setq ns-alternate-modifier (quote super))))
      ((string-match "freebsd" system-configuration)
       (setq exec-path (cons "/usr/local/bin:/bin:/usr/bin:" exec-path))
       (setenv "PATH"
               (concat '"/usr/local/bin:/bin:/usr/bin:"
                       (getenv "PATH")))))
