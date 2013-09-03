(setq erc-server-coding-system '(utf-8 . utf-8))
(require 'erc-join)
(erc-autojoin-mode 1)
(setq erc-autojoin-channels-alist
          '(("freenode.net"
             "#mikutter")))
(add-hook 'erc-after-connect
          '(lambda (SERVER NICK)
             (cond
              ((string-match "freenode\\.net" SERVER)
               (erc-message "katsyoshi" "")))))

