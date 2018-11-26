(setq jackthemico-programming-packages '(
                                         yasnippet
                                         helm-c-yasnippet
                                         evil
                                         visual-regexp
                                         visual-regexp-steroids
                                         (python :location built-in)
                                         company
                                         ))

(defun jackthemico-programming/post-init-yasnippet ()
  (progn
    (set-face-background 'secondary-selection "gray")
    (setq-default yas-prompt-functions '(yas-ido-prompt yas-dropdown-prompt))
    (mapc #'(lambda (hook) (remove-hook hook 'spacemacs/load-yasnippet)) '(prog-mode-hook
                                                                           org-mode-hook
                                                                           markdown-mode-hook
                                                                           python-mode-hook))

    (spacemacs/add-to-hooks 'jackthemico/load-yasnippet '(prog-mode-hook
                                                          markdown-mode-hook
                                                          org-mode-hook
                                                          python-mode-hook))
    )
  )

(defun jackthemico-programming/post-init-helm-c-yasnippet ()
  (use-package helm-c-yasnippet)
  )

(defun jackthemico-programming/post-init-python ()
  (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'python-mode-hook 'spacemacs/toggle-relative-line-numbers-on)
  ;; if you use pyton3, then you could comment the following line
  (setq python-shell-interpreter "ipython2")
  (setq python-shell-interpreter-args "--simple-prompt -i")
  )

(defun jackthemico-programming/post-init-evil ()
  (progn
    (define-key evil-insert-state-map "\C-j" 'next-line)
    (define-key evil-insert-state-map "\C-k" 'previous-line)
    (define-key evil-insert-state-map "\C-h" 'backward-char)
    (define-key evil-insert-state-map "\C-l" 'forward-char)
    (define-key evil-insert-state-map "\C-f" 'forward-word)
    (define-key evil-insert-state-map "\C-b" 'backward-word)
    (define-key evil-ex-completion-map "\C-a" 'move-beginning-of-line)
    (define-key evil-ex-completion-map "\C-k" 'kill-line)
    )
  )

(defun jackthemico-programming/init-visual-regexp ()
  (use-package visual-regexp
    :commands (vr/replace vr/query-replace)))

(defun jackthemico-programming/init-visual-regexp-steroids ()
  (use-package visual-regexp-steroids
    :commands (vr/select-replace vr/select-query-replace)
    :init
    (progn
      (define-key global-map (kbd "C-c r") 'vr/replace)
      (define-key global-map (kbd "C-c q") 'vr/query-replace))))

(defun jackthemico-programming/post-init-company ()
  (defun python/init-company-jedi ()
    (use-package company-jedi
      :if (configuration-layer/package-usedp 'company)
      :defer t
      :init
      (push 'company-jedi company-backends-python-mode)))
  (progn
    (setq company-minimum-prefix-length 1
          company-idle-delay 0.02)

    (when (configuration-layer/package-usedp 'company)
      (spacemacs|add-company-backends :modes shell-script-mode makefile-bsdmake-mode sh-mode lua-mode nxml-mode conf-unix-mode json-mode graphviz-dot-mode))
    )
  )
