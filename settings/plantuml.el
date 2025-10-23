;; -*- lexical-binding: t -*-
(when (require 'plantuml-mode nil 'noerror)
  (add-to-list 'auto-mode-alist '("\\.uml\\'" . plantuml-mode))
  (setq plantuml-jar-path "~/.bin/plantuml-1.2022.4.jar")
  (setq plantuml-default-exec-mode 'jar)
  (setq plantuml-indent-level 2))
