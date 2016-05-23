;; theme
(load-theme 'wombat t)

;; smooth-scroll
;(smooth-scroll-mode t)

;; hlinum
(hlinum-activate)
(global-linum-mode t)
(setq linum-format "%4d ")

;; Yet Another Scroll Bar Mode
(global-yascroll-bar-mode 1)

(setq display-buffer-function 'popwin:display-buffer)

;; smartparen
(smartparens-global-mode t)

;; 対応する括弧を光らせる。
(show-paren-mode 1)

(global-auto-highlight-symbol-mode t)

(volatile-highlights-mode t)

;;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)

;;; 行末の空白を表示
(setq-default show-trailing-whitespace t)

;; 行間を開ける量、これを調整することでかなり見え方が変わる
(setq-default line-spacing 2)

;;; 現在行を目立たせる
(global-hl-line-mode)

;;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;;; 端末で作業をするときメニューバーを非表示
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))
;;;時計を表示 曜日・月・日を表示
(display-time-mode t)

;;; スペースとタブを可視化
(require 'whitespace)
