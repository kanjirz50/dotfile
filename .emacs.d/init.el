;; Loading el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;(setq el-get-user-package-directory "~/.emacs.d/el-get-user/init-files")

;; Init-loader
(el-get-bundle init-loader
  :features init-loader
  (init-loader-load "~/.emacs.d/conf"))



;; ;; el-get

;; ;; Added by Package.el.  This must come before configurations of
;; ;; installed packages.  Don't delete this line.  If you don't want it,
;; ;; just comment it out by adding a semicolon to the start of the line.
;; ;; You may delete these explanatory comments.
;; (package-initialize)

;; (add-to-list 'load-path "~/.emacs.d/el-get")
;; (setq el-get-dir "~/.emacs.d/el-get-packages")
;; (require 'el-get)

;; (add-to-list 'load-path "~/.emacs.d/site-packages/emacs-async")
;; (add-to-list 'load-path "~/.emacs.d/site-packages/helm")
;; (add-to-list 'load-path "~/.emacs.d/site-packages/auto-complete-clang-async")
;; (require 'helm-config)
;; (helm-mode 1)

;; (el-get-bundle init-loader
;;   :features init-loader
;;   (init-loader-load "~/.emacs.d/conf"))

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(ac-clang-cflags (quote ("-I/tools/env/include")))
;;  '(flycheck-display-errors-delay 0.5)
;;  '(flycheck-display-errors-function
;;    (lambda
;;      (errors)
;;      (let
;; 	 ((messages
;; 	   (mapcar
;; 	    (function flycheck-error-message)
;; 	    errors)))
;;        (popup-tip
;; 	(mapconcat
;; 	 (quote identity)
;; 	 messages "
;; ")))))
;;  '(package-selected-packages (quote (nil let-alist gitconfig-mode))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (nil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
