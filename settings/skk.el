;; SKK辞書
;; (let ((default-directory (expand-file-name "~/.emacs.d/share/skk/")))
;;  (add-to-list 'load-path default-directory)
;;  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;;      (normal-top-level-add-subdirs-to-load-path)))
;; SKK
(ddskk-posframe-mode 1)
(require 'skk)
(global-set-key (kbd "C-\\") 'skk-mode)
(global-set-key (kbd "C-x j") 'skk-auto-fill-mode)
(global-set-key (kbd "C-m") 'newline-and-indent)

(add-hook 'skk-load-hook
          (lambda ()
            ;; コード中では自動的に英字にする。
            ;; (require 'context-skk)
            (setq skk-jisyo-code 'utf-8)
            (setq skk-large-jisyo "~/.emacs.d/share/skk/SKK-JISYO.L")
            ;;(setq skk-comp-mode t) ;; 動的自動補完
            ;;(setq skk-auto-insert-paren t)
            ;; (setq skk-delete-implies-kakutei nil)
            ;; (setq skk-henkan-strict-okuri-precedence t)
            (setq default-input-method "japanese-skk")
            (setq skk-egg-like-newline t)
            (setq-default skk-kutouten-type 'jp)
            (setq-default ispell-program-name "aspell")

            (setq skk-show-annotation t) ;; 単語の意味をアノテーションとして表示。例) いぜん /以前;previous/依然;still/

            ;; ;; 半角で入力したい文字
            ;; (setq skk-rom-kana-rule-list
            ;;       (nconc skk-rom-kana-rule-list
            ;;              '((";" nil nil)
            ;;                (":" nil nil)
            ;;                ("?" nil nil)
            ;;                ("!" nil nil))))
            ))

