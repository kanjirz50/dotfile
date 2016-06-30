;=================================
;Python
;=================================

;; pythonファイルをpep8で保存
(require 'py-autopep8)
(py-autopep8-enable-on-save)

;; インデントブロックを可視化
(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation-mode)
(set-face-background 'highlight-indentation-face "#383835")

;; jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(setq jedi:setup-keys t)
(setq jedi:server-command '("~/.pyenv/shims/jediepcserver"))


(add-hook 'python-mode-hook
	  '(lambda ()
	     (jedi:setup)
	     (define-key python-mode-map (kbd "<C-tab>") 'jedi:complete)
	     (define-key python-mode-map (kbd "C-c u") 'jedi:goto-definition)
	     (define-key python-mode-map (kbd "C-c ?") 'jedi:show-doc)
	     (define-key python-mode-map (kbd "C-c ,") 'jedi:goto-definition-pop-marker)
	     (setq ac-sources
		   (delete 'ac-source-words-in-same-mode-buffers ac-sources))
	     (add-to-list 'ac-sources 'ac-source-filename)
	     (add-to-list 'ac-sources 'ac-source-jedi-direct)
	     (highlight-indentation-mode t)
	     (hs-minor-mode t)
	     )
	  )


