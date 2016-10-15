;;; 50_visual.el --- 描画に関すること

;;; Theme:
(load-theme 'wombat t)

;; hlinum
(global-linum-mode t)
(setq linum-format "%4d ")
(setq display-buffer-function 'popwin:display-buffer)

;; (global-auto-highlight-symbol-mode t)
;; (volatile-highlights-mode t)
;; ;;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
;; (setq show-paren-style 'mixed)

;;; 行末の空白を表示
(setq-default show-trailing-whitespace t)
;; 対応する括弧を光らせる。
(show-paren-mode 1)
;;; 現在行を目立たせる
(global-hl-line-mode)
(custom-set-faces
 '(hl-line ((t (:background "color-238"))))
 ; '(mode-line-buffer-id ((t (:foreground nil :background "color-234"))))
 )
;; 選択範囲の色を指定
(set-face-background 'region "brightblack")
(set-face-foreground 'region "white")

;;; 端末で作業をするときメニューバーを非表示
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))
 
