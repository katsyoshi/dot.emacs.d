;; -*- lexical-binding: t -*-
(if (require 'twittering-mode nil 'noerror)
    (setq twittering-auth-method 'xauth)
  (message "twittering-mode not available; skipping Twitter config."))
