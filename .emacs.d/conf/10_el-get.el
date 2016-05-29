;; visuals
(el-get-bundle highlight-symbol
  (highlight-symbol-mode t))
(el-get-bundle popwin)
(el-get-bundle powerline
  :features powerline
  (powerline-default-theme)
  )

;; utils
(el-get-bundle undo-tree)
(el-get-bundle anzu)
(el-get-bundle exec-path-from-shell)
(el-get-bundle undohist
  :features undohist)

;; ;; mode
(el-get-bundle yaml-mode)
(el-get-bundle markdown-mode)

;; complete
(el-get-bundle auto-complete)

;; programming
(el-get-bundle yasnippet)
(el-get-bundle flycheck)

;; ;; python
(el-get-bundle jedi)
(el-get-bundle py-autopep8)
;(el-get-bundle python-pylint)
