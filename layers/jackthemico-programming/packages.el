(setq jackthemico-programming-packages '(
                                         yasnippet
                                         ;; evil
                                         visual-regexp
                                         visual-regexp-steroids
                                         (python :location built-in)
                                         dap-mode
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

(defun jackthemico-programming/pre-init-dap-mode ()
  (add-to-list 'spacemacs--dap-supported-modes 'python-mode))

(defun make-dap-breakpoint-works ()
  (require 'dap-mode)
  (progn
    (spacemacs/declare-prefix-for-mode 'python-mode "mdp" "breakpoints")
    (spacemacs/set-leader-keys-for-major-mode 'python-mode
      ;; breakpoints
      "dpb" #'dap-breakpoint-toggle
      "dpc" #'dap-breakpoint-condition
      "dpl" #'dap-breakpoint-log-message
      "dph" #'dap-breakpoint-hit-condition
      "dpa" #'dap-breakpoint-add
      "dpd" #'dap-breakpoint-delete
      "dpD" #'dap-breakpoint-delete-all
      )
    )
  )

(defun jackthemico-programming/post-init-python ()
  (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  ;; if you use pyton3, then you could comment the following line
  (setq python-shell-interpreter "ipython")
  (setq types ["default" "confused" "emacs" "nyan" "rotating" "science" "thumbsup"])
  (setq index 0)
  (add-hook 'python-mode-hook #'(lambda () (make-dap-breakpoint-works)))
  (add-hook 'python-mode-hook #'(lambda () (turn-on-evil-surround-mode)))
  (add-hook 'evil-normal-state-exit-hook #'(lambda () (change-parrot-type types index)))
  (add-hook 'evil-normal-state-entry-hook #'(lambda () (change-parrot-type types index)))
  (add-hook 'magit-mode-hook #'(lambda () (change-parrot-type types index)))
  (setq python-shell-interpreter-args "--simple-prompt -i")
  )

(defun jackthemico-programming/post-init-dap-mode ()
  (progn
    (require 'dap-mode)
    (add-hook 'dap-stopped-hook (lambda (arg) (call-interactively #'dap-ui-sessions)))
    (add-hook 'dap-stopped-hook (lambda (arg) (call-interactively #'dap-ui-locals)))
    (add-hook 'dap-stopped-hook
          (lambda (arg) (call-interactively #'dap-hydra)))
    (dap-register-debug-template "Python apimonitor"
                                 (list :type "python"
                                       :args "runserver 0.0.0.0:8001 --noreload"
                                       :cwd nil
                                       :target-module (expand-file-name "/mnt/d/code/python/ApiMonitor/adminew/manage.py")
                                       ;; :module "django"
                                       :program nil
                                       :request "launch"
                                       :name "Python apimonitor"))
    )
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
