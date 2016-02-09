;設定ファイル一覧
;=================================
; load-path
; 外観
; 補完機能
; 履歴やバッファ
; キーバインド
; 保存
; その他
;=================================
;load-path
;=================================
;;; add site-lisp
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

;;; add elpa
(let ((default-directory (expand-file-name "~/.emacs.d/elpa")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

;=================================
;外観
;=================================
;;; テーマファイルの読み込み
;(load-theme 'tsdh-dark t)
(load-theme 'wombat t)

;;; Localeに合わせた環境の設定
(set-locale-environment nil)

;;; 対応する括弧を光らせる。
(show-paren-mode 1)

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

;;; 行数を左に表示
(global-linum-mode t)

;;; 端末で作業をするときメニューバーを非表示
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))

;;;タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")

;;;時計を表示 曜日・月・日を表示
(display-time-mode t)

;; バッファの同一ファイル名を区別する
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;; スペースとタブを可視化
(require 'whitespace)

;; (setq whitespace-style '(face tabs tab-mark spaces space-mark lines-tail trailing space-before-tab space-after-tab::space))
;; (setq whitespace-space-regexp "\\(\x3000+\\)")
;; (setq whitespace-display-mappings
;;       '((space-mark ?\x3000 [?\□])
;;         (tab-mark   ?\t   [?\xBB ?\t])
;;         ))
;; (global-whitespace-mode t)

;; (set-face-attribute 'whitespace-trailing nil
;;                     :foreground "DeepPink"
;;                     :underline t)
;; (set-face-attribute 'whitespace-tab nil
;;                     :foreground "LightSkyBlue"
;;                     :underline t)
;; (set-face-attribute 'whitespace-space nil
;;                     :foreground "GreenYellow"
;;                    :weight 'bold)

;;; 選択した変数と同じ変数をを自動的にハイライト
;; C-x C-a で、ハイライトしている変数を一括でリネームできる
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)

;; Window 分割を画面サイズに従って計算する
(defun split-window-vertically-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-vertically)
    (progn
      (split-window-vertically
       (- (window-height) (/ (window-height) num_wins)))
      (split-window-vertically-n (- num_wins 1)))))
(defun split-window-horizontally-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-horizontally)
    (progn
      (split-window-horizontally
       (- (window-width) (/ (window-width) num_wins)))
      (split-window-horizontally-n (- num_wins 1)))))

;; Window 分割・移動を C-t で
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (if (>= (window-body-width) 270)
        (split-window-horizontally-n 3)
      (split-window-horizontally)))
  (other-window 1))
(global-set-key (kbd "C-x t") 'other-window-or-split)
;=================================
;補完機能
;=================================
;;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

;;; jedi
(setenv "PYTHONPATH" "/usr/local/lib/python2.7/site-packages")
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;jediパッケージがインストールされている環境の場合のみ,jediをセットアップする
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/jedi/emacs-deferred")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/jedi/emacs-epc")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/jedi/emacs-ctable")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/jedi/emacs-jedi")
;; ;(require 'auto-complete-config)
;; (require 'python)
;; (require 'jedi)
;; (add-hook 'python-mode-hook 'jedi:ac-setup)
;; (define-key python-mode-map (kbd "<C-tab>") 'jedi:complete)

;; (when (require 'jedi nil t)
;;   (require 'epc)
;;   (require 'auto-complete-config)
;;   (require 'python)

;; PYTHONPATH上のソースコードがauto-completeの補完対象になる ;;;;;
;;   /home/takahashi/.emacs.d/site-lisp/jedi/emacs-jedi/env/local/lib/python2.7
;;   (setenv "PYTHONPATH" "/usr/local/lib/python2.7/site-packages")
;;   ; (require 'jedi)
;;   (add-hook 'python-mode-hook 'jedi:setup)
;;   (setq jedi:complete-on-dot t)

;;   (add-hook 'python-mode-hook
;;             '(lambda ()
;;                (jedi:ac-setup)
;;                (define-key python-mode-map (kbd "<C-return>") 'jedi:complete)
;;                )))

;;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;;; 部分一致の補完機能を使う
;;; p-bでprint-bufferとか
;(partial-completion-mode t)

;;; 補完可能なものを随時表示
;;; 少しうるさい
;;; (icomplete-mode 1)


;;; ミニバッファなどが、zshライクの動作（補完）となる
;; (require 'zlc)
;; (zlc-mode t)
;; ;; zlcの補完をtab一回で有効にするかどうか
;; ;; (setq zlc-select-completion-immediately t)
;; ;; zlcのキーバインド
;; (let ((map minibuffer-local-map))
;;   ;;; like menu select
;;   (define-key map (kbd "<down>")  'zlc-select-next-vertical)
;;   (define-key map (kbd "<up>")    'zlc-select-previous-vertical)
;;   (define-key map (kbd "<right>") 'zlc-select-next)
;;   (define-key map (kbd "<left>")  'zlc-select-previous)
;;   ;;; reset selection
;;   (define-key map (kbd "C-c") 'zlc-reset)
;;   )

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

;=================================
;保存
;=================================
;ファイルの先頭に#!があると、保存時に実行権を付与
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;=================================
;その他
;=================================
;タブはスペース幅4として挿入される
(setq-default tab-width 4 indent-tabs-mode nil)

;; ;undo-tree-mode
;; (require 'undo-tree)
;; (global-undo-tree-mode t)
;; (global-set-key (kbd "C-x C-u") 'undo-tree-redo)

;================================
;Python
;================================
;: 関数を折りたたむ機能
(add-hook 'python-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
;; キーバインド設定
(define-key global-map (kbd "C-\\") 'hs-toggle-hiding) 

;;; 80文字目以降を強調
(add-hook 'python-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
      '(("^[^\n]\\{80\\}\\(.*\\)$" 1 font-lock-warning-face t)))))

;テンプレート
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/template/")
(define-auto-insert "\\.py$" "python-template.py")

;; Pythonの時、閉じカッコ補完
(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map "\"" 'electric-pair)
            (define-key python-mode-map "\'" 'electric-pair)
            (define-key python-mode-map "(" 'electric-pair)
            (define-key python-mode-map "[" 'electric-pair)
            (define-key python-mode-map "{" 'electric-pair)))
(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))

;; flymake
;; (require 'tramp-cmds)
;; (when (load "flymake" t)
;;   (defun flymake-pyflakes-init ()
;;   ; Make sure it's not a remote buffer or flymake would not work
;;     (when (not (subsetp (list (current-buffer)) (tramp-list-remote-buffers)))
;;       (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                          'flymake-create-temp-inplace))
;;              (local-file (file-relative-name
;;                           temp-file
;;                           (file-name-directory buffer-file-name))))
;;         (list "pyflakes" (list local-file)))))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pyflakes-init)))

;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (flymake-mode t)))

;; pythonファイルをpep8で保存
(require 'py-autopep8)
(add-hook 'before-save-hook 'py-autopep8-before-save)


;; インデントブロックを可視化
(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation-mode)
;(set-face-background 'highlight-indentation-face "#e3e3d3")
(set-face-background 'highlight-indentation-face "#383835")
; (set-face-background 'highlight-indentation-current-column-face "#c3b3b3")


;;markdown
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
