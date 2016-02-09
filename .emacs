;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

(load (expand-file-name (concat (getenv "HOME") "/.emacs.d/init")))

;; 読み込むパッケージの設定
;; (when (>= emacs-major-version 24)
;;   (require 'package)
;;   (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;;   (package-initialize)
;;   (unless (package-installed-p 'init-loader)
;;     (package-refresh-contents)
;;     (package-install 'init-loader))
;;   (require 'init-loader)
;;   (init-loader-load)
;;   (package-refresh-contents))
;; )

;; 読み込むパッケージの設定
(when (>= emacs-major-version 24)
  ;; package
  (require 'package)
  ;; MELPAを追加
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  ;; Marmaladeを追加
  (add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
  ;; 初期化
  (package-initialize)
)

