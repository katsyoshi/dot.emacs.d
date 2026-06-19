;; -*- lexical-binding: t -*-
(require 'magit)
(require 'magit-repos)

(defvar dotemacs/magit-repository-exclude-directories
  '("~/Program/Gems")
  "Directories excluded from Magit repository discovery.")

(defun dotemacs/magit-repository-excluded-p (directory)
  "Return non-nil if DIRECTORY is excluded from Magit repository discovery."
  (let ((directory (file-name-as-directory (expand-file-name directory)))
        found)
    (dolist (excluded dotemacs/magit-repository-exclude-directories found)
      (let ((excluded (file-name-as-directory (expand-file-name excluded))))
        (when (string-prefix-p excluded directory)
          (setq found t))))))

(defun dotemacs/magit-list-repos-skip-excluded (orig directory depth)
  "Skip excluded directories while collecting Magit repositories."
  (unless (dotemacs/magit-repository-excluded-p directory)
    (funcall orig directory depth)))

(advice-add 'magit-list-repos-1
            :around #'dotemacs/magit-list-repos-skip-excluded)

(setq magit-repository-directories '(("~/Program" . 3)))

(global-set-key (kbd "C-x C-g") 'magit-status)
