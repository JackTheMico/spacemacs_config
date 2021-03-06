(define-key global-map (kbd "C-c y") 'youdao-dictionary-search-at-point+)
(define-key global-map (kbd "C-c s") 'youdao-dictionary-search)
(spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)
(spacemacs/set-leader-keys "oi" 'youdao-dictionary-search-from-input)
(spacemacs/set-leader-keys "op" 'jackthemico/toggle-env-http-proxy)
(spacemacs/set-leader-keys-for-major-mode 'python-mode "dP" 'jackthemico/add-pdb)
(define-key evil-normal-state-map (kbd "s") 'avy-goto-char)
(define-key evil-normal-state-map (kbd "gl") 'avy-goto-line)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-insert-state-map "\C-q" 'evil-normal-state)
(define-key evil-normal-state-map (kbd ",3") 'jackthemico/change-python3)
(define-key evil-normal-state-map (kbd ",2") 'jackthemico/change-python2)

(define-key evil-insert-state-map "\C-j" 'next-line)
(define-key evil-insert-state-map "\C-k" 'previous-line)
(define-key evil-insert-state-map "\C-h" 'backward-char)
(define-key evil-insert-state-map "\C-l" 'forward-char)
(define-key evil-insert-state-map "\C-f" 'forward-word)
(define-key evil-insert-state-map "\C-b" 'backward-word)
(define-key evil-insert-state-map "\C-a" 'beginning-of-line)
(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-normal-state-map "\C-a" 'move-beginning-of-line)
(define-key evil-normal-state-map "\C-e" 'end-of-line)
;; parrot for evil users
(define-key evil-normal-state-map (kbd "[r") 'parrot-rotate-prev-word-at-point)
(define-key evil-normal-state-map (kbd "]r") 'parrot-rotate-next-word-at-point)

(spacemacs|add-toggle toggle-shadowsocks-proxy-mode
  :status shadowsocks-proxy-mode
  :on (global-shadowsocks-proxy-mode)
  :off (global-shadowsocks-proxy-mode -1)
  :documentation "Toggle shadowsocks proxy mode."
  :evil-leader "os")
