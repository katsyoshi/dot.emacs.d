(require 'e2wm)
(global-set-key (kbd "M-+") 'e2wm:start-management)
;;(global-set-key (kbd "M-s M-s") 'shell)
(e2wm:add-keymap
 e2wm:pst-minor-mode-keymap
 '(("<M-left>"  . e2wm:dp-code ) ; codeへ変更
   ("<M-right>" . e2wm:dp-two) ; twoへ変更
   ("<M-up>"    . e2wm:dp-doc)  ; docへ変更
   ("<M-down>"  . e2wm:dp-dashboard) ; dashboardへ変更
   ("C-c C-n"   . e2wm:pst-history-forward-command) ; 履歴進む
   ("C-c C-p"   . e2wm:pst-history-back-command) ; 履歴戻る
   ("C-c C-s"   . e2wm:my-toggle-sub) ; subの表示をトグルする
   ("C-M-s"     . multi-term) ;; shellを起動する
   ("M-m"       . e2wm:pst-window-select-main-command) ; メインウインドウを選択する
   ) e2wm:prefix-key)

(e2wm:add-keymap
 e2wm:dp-doc-minor-mode-map
 '(("prefix I" . info)) ; infoを起動する
 e2wm:prefix-key)

(defun e2wm:my-toggle-sub () ; Subをトグルする関数
  (interactive)
  (e2wm:pst-window-toggle 'sub t 'main))