;; SKK辞書
(let ((default-directory (expand-file-name "~/.emacs.d/share/skk/")))
 (add-to-list 'load-path default-directory)
 (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
     (normal-top-level-add-subdirs-to-load-path)))
;; SKK
(require 'skk-autoloads)
(global-set-key (kbd "C-c C-j") 'skk-mode)
(global-set-key (kbd "C-x j") 'skk-auto-fill-mode)
(global-set-key (kbd "C-m") 'newline-and-indent)
(setq default-input-method "japanese-skk")
;; 送り仮名が厳密に正しい候補を優先して表示
(setq skk-henkan-strict-okuri-precedence t)
;; 漢字登録時、送り仮名が厳密に正しいかをチェック
(setq skk-check-okurigana-on-touroku t)
;; 漢字変換のとき、Enterキーを入力すると変換決定
(setq skk-egg-like-newline t)
;; 句読点変更
(setq-default skk-kutouten-type 'jp)
;; Aspell
(setq-default ispell-program-name "aspell")
