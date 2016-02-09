;===============
; package.elの設定
;===============
(require 'package)
(add-to-list 'package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
