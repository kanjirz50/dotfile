;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get")
(setq el-get-dir "~/.emacs.d/el-get-packages")
;(setq el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;(setq el-get-user-package-directory "~/.emacs.d/el-get-init-files")
(require 'el-get)

(el-get 'sync)


(add-to-list 'load-path "~/.emacs.d/site-packages/emacs-async")
(add-to-list 'load-path "~/.emacs.d/site-packages/helm")
(require 'helm-config)
(helm-mode 1)

(el-get-bundle init-loader
  :features init-loader
  (init-loader-load "~/.emacs.d/conf"))

