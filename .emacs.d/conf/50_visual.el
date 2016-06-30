;; theme
(load-theme 'wombat t)

;; hlinum
;; (hlinum-activate)
(global-linum-mode t)
(setq linum-format "%4d ")


;(setq display-buffer-function 'popwin:display-buffer)

;; 対応する括弧を光らせる。
(show-paren-mode 1)

;; (global-auto-highlight-symbol-mode t)

;; (volatile-highlights-mode t)

;; ;;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
;; (setq show-paren-style 'mixed)

;;; 行末の空白を表示
(setq-default show-trailing-whitespace t)

;; ;;; 現在行を目立たせる
(global-hl-line-mode)

;;; 端末で作業をするときメニューバーを非表示
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))

;; 選択範囲の色を指定
(set-face-background 'region "brightblack")
(set-face-foreground 'region "white")
