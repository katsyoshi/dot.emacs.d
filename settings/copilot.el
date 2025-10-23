;; -*- lexical-binding: t -*-
(require 'copilot)
(add-hook 'ruby-ts-mode-hook 'copilot-mode)

(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
(add-to-list 'copilot-major-mode-alist '("ruby-ts-mode" . "ruby"))
