;=================================
;キーバインド
;=================================
;バックスペースをC-hに割り当てる
(global-set-key "\C-h" 'delete-backward-char)

;C-mにnewline-and-indentを割り当てる。
(global-set-key (kbd "C-m") 'newline-and-indent)

;C-x oの逆の動き
(global-set-key (kbd "C-x p") (lambda () (interactive) (other-window -1)))

;バッファの切り替え
(global-set-key (kbd "C-x C-p") 'previous-buffer)
(global-set-key (kbd "C-x C-n") 'next-buffer)

;PageUp,PageDown
(global-set-key (kbd "C-x p") 'scroll-up-command)
(global-set-key (kbd "C-x v") 'scroll-down-command)

;指定の行に映る
(global-set-key "\M-g" 'goto-line)

;再起動無しで、.emacsを再読み込み
(global-set-key "\M-p" 'eval-current-buffer)
