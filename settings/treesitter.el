;; -*- lexical-binding: t -*-
(require 'treesit)

(defconst dotemacs/tree-sitter-has-legacy
  (and (require 'tree-sitter nil 'noerror)
       (require 'tree-sitter-langs nil 'noerror))
  "Non-nil when the external tree-sitter packages are available.")

(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (haskell "https://github.com/tree-sitter/tree-sitter-haskell")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (java "https://github.com/tree-sitter/tree-sitter-java")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (kdl "https://github.com/tree-sitter-grammars/tree-sitter-kdl")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (rbs "https://github.com/joker1007/tree-sitter-rbs")
     (ruby "https://github.com/tree-sitter/tree-sitter-ruby")
     (rust "https://github.com/tree-sitter/tree-sitter-rust")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

;; auto settings
(dolist (lang (mapcar #'car treesit-language-source-alist))
  (unless (treesit-language-available-p lang)
    (when (fboundp 'treesit-install-language-grammar)
      (ignore-errors
        (treesit-install-language-grammar lang))))
  (unless (memq lang '(rbs kdl markdown))
    (let ((major-mode-name (intern (concat (symbol-name lang) "-mode")))
          (major-ts-mode-name (intern (concat (symbol-name lang) "-ts-mode"))))
      (when (and (fboundp major-mode-name)
                 (fboundp major-ts-mode-name))
        (add-to-list 'major-mode-remap-alist
                     `(,major-mode-name . ,major-ts-mode-name))))
    (when (and dotemacs/tree-sitter-has-legacy
               (fboundp 'tree-sitter-require))
      (ignore-errors
        (tree-sitter-require lang)))))

;; load extra language configurations
(let ((javascript-config (expand-file-name "settings/tree-sitter/javascript"
                                           user-emacs-directory)))
  (when (file-readable-p (concat javascript-config ".el"))
    (load javascript-config nil 'nomessage)))
