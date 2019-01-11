
(defun jackthemico/load-yasnippet ()
  (interactive)
  (unless yas-global-mode
    (progn
      (yas-global-mode 1)
      ;; (setq aya-persist-snippets-dir "~/.spacemacs.d/snippets")
      (setq my-snippet-dir (expand-file-name "~/.spacemacs.d/snippets"))
      (setq yas-snippet-dirs  my-snippet-dir)
      (yas-load-directory my-snippet-dir)
      (setq yas-wrap-around-region t)))
  (yas-minor-mode 1))

(defun jackthemico/change-python2 ()
  (interactive)
  (progn
    (setq python-indent-offset 4
          python-sort-imports-on-save t
          python-shell-interpreter "ipython2"
          importmagic-python-interpreter "python2"
          flycheck-python-pylint-executable "pylint"
          flycheck-python-flake8-executable "flake8"
          )
    (doom-modeline-refresh-bars)
    (message "use python2 now~!")
    )
  )

(defun jackthemico/change-python3 ()
  (interactive)
  (progn
    (setq python-indent-offset 4
          python-sort-imports-on-save t
          python-shell-interpreter "ipython3"
          importmagic-python-interpreter "python3"
          flycheck-python-pylint-executable "pylint"
          flycheck-python-flake8-executable "flake8"
          )
    (doom-modeline-refresh-bars)
    (message "use python3 now~!")
    )
  )

(defun jackthemico/add-pdb ()
  (interactive)
  (let (
        (trace "import pdb; pdb.set_trace()")
        (line (thing-at-point 'line))
        )
    (if (and line (string-match trace line))
        (kill-whole-line)
      (progn
        (back-to-indentation)
        (insert trace)
        (insert "\n")
        (python-indent-line))
      )
    )
  )
