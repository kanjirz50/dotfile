
;; visuals
(el-get-bundle highlight-symbol
  :features highlight-symbol
  (add-hook 'prog-mode-hook 'highlight-symbol-mode)
  (global-set-key [(control f3)] 'highlight-symbol)
  (global-set-key [f3] 'highlight-symbol-next)
  (global-set-key [(shift f3)] 'highlight-symbol-prev)
  (global-set-key [(meta f3)] 'highlight-symbol-query-replace))

(el-get-bundle highlight-indentation)

(el-get-bundle undo-tree
  (global-undo-tree-mode t))

(el-get-bundle exec-path-from-shell
  (exec-path-from-shell-initialize))

(el-get-bundle popwin
  :features popwin
  (popwin-mode 1))

(el-get-bundle direx
  :features direx
  :depends (popwin)
  (push '(direx:direx-mode :position left :width 25 :dedicated t)
	popwin:special-display-config)
  (global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window))

(el-get-bundle py-autopep8
  (py-autopep8-enable-on-save))

;; complete
(el-get-bundle auto-complete)

(el-get-bundle jedi)

(el-get-bundle jedi-direx
  :features jedi-direx
  :depends (jedi direx)
  (add-hook 'jedi-mode-hook 'jedi-direx:setup))

(el-get-bundle helm)

;; mode
(el-get-bundle yaml-mode)
(el-get-bundle markdown-mode)
(el-get-bundle web-mode)

;; programming
;; (el-get-bundle pos-tip
;;   :type github
;;   :pkgname "tjarvstrand/pos-tip"
;;   :features pos-tip
;; )
(el-get-bundle flycheck
  (add-hook 'after-init-hook #'global-flycheck-mode))
;; (el-get-bundle flycheck-pos-tip
;;   (with-eval-after-load 'flycheck
;;   (flycheck-pos-tip-mode)))
;; ;; C
;; (el-get-bundle auto-complete-c-headers)
;; ;; (el-get-bundle irony-mode)
;; ;; (el-get-bundle company-irony)
;; (el-get-bundle auto-complete-clang)
