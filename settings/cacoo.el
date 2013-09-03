;; 基本設定
(require 'cacoo) ; cacooを読み込み
(require 'cacoo-plugins)      ; 追加機能
(setq cacoo:api-key "nBJ79g4bjQ2FpEWEkV") ; ←CacooのAPIキーを入れる（使わない人は無くてもOK）
(global-set-key (kbd "M--") 'toggle-cacoo-minor-mode) ; Alt+「-」で切り替え
;; 追加設定
(setq cacoo:img-dir-ok t) ; 画像フォルダは確認無しで作る