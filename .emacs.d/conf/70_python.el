;=================================
;Python
;=================================

;; pythonファイルをpep8で保存
;; (require 'py-autopep8)
;; (add-hook 'before-save-hook 'py-autopep8-before-save)

;; インデントブロックを可視化
;; (require 'highlight-indentation)
;; (add-hook 'python-mode-hook 'highlight-indentation-mode)
;; (set-face-background 'highlight-indentation-face "#383835")

;; (require 'python-pylint)
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)

(setq jedi:server-command '("~/.pyenv/shims/jediepcserver"))
