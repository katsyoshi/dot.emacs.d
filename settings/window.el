;; -*- lexical-binding: t -*-
(if (require 'e2wm nil 'noerror)
    (progn
      (global-set-key (kbd "M-+") #'e2wm:start-management)
      (e2wm:add-keymap
       e2wm:pst-minor-mode-keymap
       '(("<M-left>"  . e2wm:dp-code)
         ("<M-right>" . e2wm:dp-two)
         ("<M-up>"    . e2wm:dp-doc)
         ("<M-down>"  . e2wm:dp-dashboard)
         ("C-c C-n"   . e2wm:pst-history-forward-command)
         ("C-c C-p"   . e2wm:pst-history-back-command)
         ("C-c C-s"   . e2wm:my-toggle-sub)
         ("C-M-s"     . multi-term)
         ("M-m"       . e2wm:pst-window-select-main-command))
       e2wm:prefix-key)

      (e2wm:add-keymap
       e2wm:dp-doc-minor-mode-map
       '(("prefix I" . info))
       e2wm:prefix-key)

      (defun e2wm:my-toggle-sub ()
        ;; Toggle the sub window from E2WM dashboards.
        (interactive)
        (e2wm:pst-window-toggle 'sub t 'main)))
  (message "e2wm not available; window management bindings skipped."))
