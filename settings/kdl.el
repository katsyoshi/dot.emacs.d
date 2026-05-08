;; -*- lexical-binding: t -*-
(require 'subr-x)

(defun dotemacs/kdl-indent-line ()
  "Indent current line of KDL."
  (let* ((offset 2)
         (pos (- (point-max) (point)))
         (indent 0))
    (save-excursion
      (beginning-of-line)
      (let ((is-closing (looking-at-p "[ \t]*}")))
        (if (bobp)
            (setq indent 0)
          (save-excursion
            (forward-line -1)
            (while (and (not (bobp)) (looking-at-p "^[ \t]*$"))
              (forward-line -1))
            (setq indent (current-indentation))
            (let ((prev (string-trim-right
                         (buffer-substring-no-properties
                          (line-beginning-position)
                          (line-end-position)))))
              (when (string-match-p "{[ \t]*\\($\\|;\\)" prev)
                (setq indent (+ indent offset)))))
          (when is-closing
            (setq indent (max 0 (- indent offset)))))))
    (indent-line-to indent)
    (when (> (- (point-max) pos) (point))
      (goto-char (- (point-max) pos)))))

(define-derived-mode kdl-mode conf-mode "KDL"
  "Major mode for KDL."
  (setq-local indent-line-function #'dotemacs/kdl-indent-line))

(add-to-list 'auto-mode-alist '("\\.kdl\\'" . kdl-mode))
