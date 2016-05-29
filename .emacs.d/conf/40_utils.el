;; 40_utils.el

;; undo-tree-mode
(global-undo-tree-mode t)

;; anzu
(global-anzu-mode +1)

;; pathの引き継ぎ
(exec-path-from-shell-initialize)

;(require 'zlc)

;============================
;履歴やバッファ
;============================

;;; 履歴数を大きくする
(setq history-length 10000)

;;; ミニバッファの履歴を保存する
(savehist-mode 1)

;;; 最近開いたファイルを保存する数を増やす
(setq recentf-max-saved-items 10000)

;;; バックアップファイルを1箇所にまとめる
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
       backup-directory-alist))

;;; バックアップファイルの数
(setq version-control t)     ; 複数のバックアップを残します。世代。
(setq kept-new-versions 5)   ; 新しいものをいくつ残すか
(setq kept-old-versions 5)   ; 古いものをいくつ残すか
(setq delete-old-versions t) ; 確認せずに古いものを消す。

;; create auto-save file in ~/.emacs.d/backup
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backup/") t)))

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;=================================
;保存
;=================================
;ファイルの先頭に#!があると、保存時に実行権を付与
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;===========
;mode
;===========
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
