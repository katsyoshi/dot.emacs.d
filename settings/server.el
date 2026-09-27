;; -*- lexical-binding: t -*-
(require 'server)
(setq server-name dotemacs/server-name)
(unless (or (daemonp)
            (server-running-p server-name))
  (server-start))
