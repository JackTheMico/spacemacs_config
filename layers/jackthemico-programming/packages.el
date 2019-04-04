(setq jackthemico-programming-packages '(
                                         yasnippet
                                         ;; evil
                                         visual-regexp
                                         visual-regexp-steroids
                                         (python :location built-in)
                                         ))

(defun jackthemico-programming/post-init-yasnippet ()
  (progn
    (set-face-background 'secondary-selection "gray")
    (setq-default yas-prompt-functions '(yas-ido-prompt yas-dropdown-prompt))
    (mapc #'(lambda (hook) (remove-hook hook 'spacemacs/load-yasnippet)) '(prog-mode-hook
                                                                           org-mode-hook
                                                                           markdown-mode-hook))

    (spacemacs/add-to-hooks 'jackthemico/load-yasnippet '(prog-mode-hook
                                                            markdown-mode-hook
                                                            org-mode-hook))
    ))


(defun change-parrot-type (list dex)
  (progn
    (if (= dex 6)
        (setq index 0)
      )
    (parrot-set-parrot-type (aref list dex))
    (incf index)
    )
  )

(defun jackthemico-programming/post-init-python ()
  (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  ;; if you use pyton3, then you could comment the following line
  (setq python-shell-interpreter "python3")
  (setq types ["default" "confused" "emacs" "nyan" "rotating" "science" "thumbsup"])
  (setq index 0)
  (add-hook 'python-mode-hook #'(lambda () (turn-on-evil-surround-mode)))
  (add-hook 'evil-normal-state-exit-hook #'(lambda () (change-parrot-type types index)))
  (add-hook 'evil-normal-state-entry-hook #'(lambda () (change-parrot-type types index)))
  (add-hook 'magit-mode-hook #'(lambda () (change-parrot-type types index)))
  ;; (setq python-shell-interpreter-args "--simple-prompt -i")
  )


;; (defun jackthemico-programming/post-init-evil ()
  ;; (progn
    ;; (define-key evil-insert-state-map "\C-j" 'next-line)
    ;; (define-key evil-insert-state-map "\C-k" 'previous-line)
    ;; (define-key evil-insert-state-map "\C-h" 'backward-char)
    ;; (define-key evil-insert-state-map "\C-l" 'forward-char)
    ;; (define-key evil-insert-state-map "\C-f" 'forward-word)
    ;; (define-key evil-insert-state-map "\C-b" 'backward-word)
    ;; (define-key evil-insert-state-map "\C-a" 'beginning-of-line)
    ;; (define-key evil-insert-state-map "\C-e" 'end-of-line)
    ;; (define-key evil-normal-state-map "\C-a" 'move-beginning-of-line)
    ;; (define-key evil-normal-state-map "\C-e" 'end-of-line)
  ;;   )
  ;; )


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
