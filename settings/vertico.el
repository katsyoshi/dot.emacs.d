;; -*- lexical-binding: t -*-
(require 'vertico)
(vertico-mode)

;; orderless 設定
(require 'orderless)
(setq completion-styles '(orderless))

(require 'vertico-directory)

(require 'marginalia)
(marginalia-mode)

(defun dotemacs/completion-hide-dotfiles-unless-typed
    (orig string pred action)
  "Hide dotfiles until file completion input starts with a dot."
  (if (string-prefix-p "." (file-name-nondirectory string))
      (funcall orig string pred action)
    (let ((completion-regexp-list
           (cons "\\(?:\\`\\.\\.?/?\\'\\|\\(?:\\`\\|/\\)[^.][^/]*\\'\\)"
                 completion-regexp-list)))
      (funcall orig string pred action))))

(advice-add 'completion-file-name-table
            :around #'dotemacs/completion-hide-dotfiles-unless-typed)

(keymap-set vertico-map "RET" #'vertico-directory-enter)
(keymap-set vertico-map "DEL" #'vertico-directory-delete-char)
