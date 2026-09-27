;;; my-profile-vals.el --- Profile-specific values -*- lexical-binding: t -*-

;;; Commentary:
;; Loaded after `my-profile' is defined in early-init.el.
;; Define values here; apply them in the corresponding feature modules.

;;; Code:

(defvar my-profile)

(defvar dotemacs/server-name my-profile
  "Emacs server name for the current profile.")

(defvar dotemacs/repository-directories
  (pcase my-profile
    ;; Add profile branches before the fallback, for example:
    ;; ("work" '(("~/Work" . 3)))
    (_ '(("~/Program" . 3))))
  "Repository directories and search depths for the current profile.")

(provide 'my-profile-vals)
;;; my-profile-vals.el ends here
