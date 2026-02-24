;; -*- lexical-binding: t -*-
(require 'server)
(setq server-name
      (or (and (boundp 'my-profile) my-profile)
          (getenv "EMACS_PROFILE")
          (and (boundp 'daemon-name) daemon-name)
          "default"))
(unless (server-running-p server-name)
  (server-start))
