;=================================
;Python
;=================================
;; jedi
(add-hook 'python-mode-hook
	  '(lambda ()
	     (jedi:setup)
	     (setq jedi:complete-on-dot t)
	     (setq jedi:setup-keys t)
	     (setq jedi:server-command '("~/.pyenv/shims/jediepcserver"))
	     (define-key python-mode-map (kbd "<C-tab>") 'jedi:complete)
	     (define-key python-mode-map (kbd "C-c u") 'jedi:goto-definition)
	     (define-key python-mode-map (kbd "C-c ?") 'jedi:show-doc)
	     (define-key python-mode-map (kbd "C-c ,") 'jedi:goto-definition-pop-marker)
	     
	     (define-key python-mode-map (kbd "C-c F") 'py-autopep8)          ; バッファ全体のコード整形
	     (define-key python-mode-map (kbd "C-c f") 'py-autopep8-region)

	     (eval-after-load "python"
	       '(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer))

	     (setq ac-sources
		   (delete 'ac-source-words-in-same-mode-buffers ac-sources))
	     (add-to-list 'ac-sources 'ac-source-filename)
	     (add-to-list 'ac-sources 'ac-source-jedi-direct)
	     
	     (highlight-indentation-mode t)
	     (set-face-background 'highlight-indentation-face "#383835")
	     
	     (hs-minor-mode t)
	     )
	  )


