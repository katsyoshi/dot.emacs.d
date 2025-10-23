;; -*- lexical-binding: t -*-
(require 'doom-themes)
(require 'doom-modeline)
(doom-modeline-mode 1)

(setq doom-themes-enable-italic t)
(setq doom-themes-enable-bold t)

(custom-set-faces
 '(doom-modeline-bar ((t (:background "#6272a4")))))

(setq doom-modeline-buffer-file-name-style 'truncate-with-project)
(setq doom-modeline-icon t)
(setq doom-modeline-major-mode-icon nil)
(setq doom-modeline-minor-modes nil)
(setq line-number-mode 0)
(setq column-number-mode 0)

(add-hook 'after-init-hook #'doom-modeline-mode)
