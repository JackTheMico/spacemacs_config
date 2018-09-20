(define-key global-map (kbd "C-c y") 'youdao-dictionary-search-at-point+)
(define-key global-map (kbd "C-c s") 'youdao-dictionary-search)
(spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)
(spacemacs/set-leader-keys "oi" 'youdao-dictionary-search-from-input)

(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-insert-state-map "\C-q" 'evil-normal-state)
