;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get")
(setq el-get-dir "~/.emacs.d/el-get-packages")
(require 'el-get)

; (el-get 'sync)

(add-to-list 'load-path "~/.emacs.d/site-packages/emacs-async")
(add-to-list 'load-path "~/.emacs.d/site-packages/helm")
(add-to-list 'load-path "~/.emacs.d/site-packages/auto-complete-clang-async")
(require 'helm-config)
(helm-mode 1)

(el-get-bundle init-loader
  :features init-loader
  (init-loader-load "~/.emacs.d/conf"))

