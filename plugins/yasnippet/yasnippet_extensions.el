(provide 'yasnippet_extensions)

(defun insert_rdoc_comments_for_arguments ()
  (re-search-forward "def \\([a-zA-Z_0-9]+\\)\\(([^)]*)\\)" nil t)
  (match-data)
  (setq method-name (buffer-substring (match-beginning 1) (match-end 1)))
  (setq method-args (buffer-substring (match-beginning 2) (match-end 2)))
  (setq start-position 1)
  (setq args-list '())
  (while (and  start-position (< start-position (length method-args)))
    (setq start-position (string-match "\\([^ ,=)]+\\)[ ]*\\(=[^,)]+\\)?[,)]" method-args start-position))
    (if start-position
        (list (push (substring method-args (match-beginning 1) (match-end 1)) args-list)
              (setq start-position (1+ (match-end 0))))    
      )
    )
  (setq normal-args-list (reverse args-list))
  (apply 'concat (mapcar (lambda (arg) (concat "#  " arg "<>::\n#    $3\n")) normal-args-list))
  )


; (comment-region (point-at-bol ) (forward-line 5))

; (apply 'concat (mapcar (lambda (x) x) '("12" "3" "2ASDASD" "2asdasASDAS")))
; def test( testing_this, you_know, I_wish_I = knew lisp )
; (match-data)