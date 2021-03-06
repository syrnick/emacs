;; -*- emacs-lisp -*-
;;
;; a file for my aliases
;;
;; (require 'my-functions)
(load-file "~/.emacs.d/my-functions.el")
;; (if (not window-system)
;;     (load-file "~/.emacs.d/terminal-alias.el")
;;   (load-file "~/.emacs.d/window-alias.el"))

(global-set-key "\C-xo" 'next-multiframe-window)
(global-set-key "\C-xp" 'previous-multiframe-window)

;; ALL OF MY Aliases
(define-key global-map "\C-cc" 'comment-region)
(define-key global-map "\C-cv" 'uncomment-region)

(global-set-key "\C-c\C-c" 'compile)
(define-key global-map [f7] 'compile)

;;(global-set-key "\C-c;ss" 'shell)
;;(global-set-key (kbd "C-'") 'shell)
(global-set-key "\C-cs" 'shell)
(global-set-key "\C-c;ss" 'bash-term)
(global-set-key (kbd "C-'") 'bash-term)
(global-set-key (kbd "C-x C-'") 'term)
(global-set-key "\C-c;v" 'toggle-viper-mode)


(global-set-key [(control tab)] 'hippie-expand)
(global-set-key "\C-ch" 'hippie-expand)
(global-set-key "\M-/" 'hippie-expand)

;;(global-set-key "\C-c\C-r" 'speedbar-refresh)
;;(global-set-key "\C-c\C-f" 'speedbar-toggle-show-all-files)
;;(global-set-key "\C-cb" 'list-buffers)

(global-set-key "\C-cb" 'switch-to-buffer)
(global-set-key [(meta f4)] 'save-buffers-kill-emacs)

;; (global-set-key "\C-x\C-b" 'switch-to-buffer)
;; (global-set-key "\C-x\C-b" 'list-buffers)
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key "\C-xnb" 'rename-buffer)

(global-set-key "\C-cl" 'windmove-right)
(global-set-key "\C-cj" 'windmove-left)
(global-set-key "\C-cn" 'windmove-down)
(global-set-key "\C-cp" 'windmove-up)

(global-set-key "\C-ci" 'ido-goto-symbol) ; or any key you see fit

(global-set-key (kbd "M-[ 5 c") 'forward-word)
(global-set-key (kbd "M-[ 5 D") 'backward-word)
(global-set-key "\M-[5c" 'forward-word)
(global-set-key "\M-[5d" 'backward-word)
;;(global-set-key "\C-j" 'newline-and-indent) ;; this is what it was
;;(global-set-key "\C-l" 'recenter) ;; this is what it was
;;also is bound to execute lisp command in scratch hopefully
;; (global-set-key "\C-j" 'backward-word)
;;(global-set-key "\C-l" 'forward-word)
;;(global-set-key "\C-c\C-l" 'recenter) ;;this is our rebinding
(global-set-key "\M-p" 'backward-paragraph)
(global-set-key "\M-n" 'forward-paragraph)

;; I really dislike this binding
;; (global-set-key "\C-x\C-x" 'exchange-point-and-mark)
;; (global-set-key "\C-x\C-p" 'mark-page)
(global-set-key "\C-x\C-p" nil)
(global-set-key "\C-m" 'newline-and-indent) 
(global-set-key "\C-xwl" 'highlight-lines-matching-regexp)
(global-set-key "\C-xwh" 'highlight-regexp)
(global-set-key "\C-xwr" 'unhighlight-regexp)
(global-set-key (kbd "C-c C-a") 'align-regexp)

(global-set-key "\C-c\C-t" 'toggle-truncate-lines)

(global-set-key "\C-c\C-f" 'grep-find)
(global-set-key "\C-cf" 'grep-find)
(global-set-key "\M-%" 'query-replace-regexp)
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\M-g" 'goto-line)

;; zapping to string/regexp and the like
(global-set-key (kbd "M-Z") 'zap-to-string)
(global-set-key (kbd "M-z") 'zap-to-regexp)
(global-set-key (kbd "C-M-z") 'zap-to-char)

(global-set-key "\C-c\C-r" 'recursive-edit)

(global-set-key "\C-xwe" 'ediff)
(global-set-key "\C-xwd" 'diff)
(global-set-key "\C-xv=" 'vc-diff)

(defun john-svn-ediff ()
    "using ediff for version diff"
    (interactive)
    (ediff-revision . (buffer-file-name)))
(global-set-key "\C-xve" 'john-svn-ediff)

(global-set-key "\C-c;sp" 'sql-postgres)
(global-set-key "\C-c;sb" 'sql-set-sqli-buffer)

(global-set-key "\C-c;xm" 'xterm-mouse-mode)

(defun save-window-layout () (interactive) (window-configuration-to-register ?z))
(defun load-window-layout () (interactive) (jump-to-register ?z))
(global-set-key [C-f12] 'save-window-layout)
(global-set-key [f12]    'load-window-layout)

(global-set-key [mouse-4] 'previous-line)
(global-set-key [mouse-5] 'next-line)

(global-set-key "\C-c;sw" 'save-current-configuration)
(global-set-key "\C-c;r" 'resume)

(global-set-key "\C-c;js" 'javascript-mode)
(global-set-key "\C-c;jh" 'sgml-mode)

(global-set-key "\C-xr\C-@" 'cua-set-rectangle-mark)

(global-set-key "\C-c;f" 'follow-mode)
(global-set-key [backtab] 'table-backward-cell)

(global-set-key "\C-cM" 'magit-status)

;; (define-key viper-vi-intercept-minor-mode (kbd "C-x C-a") 'viper-toggle-key-action)
;; (define-key viper-insert-diehard-map "\C-x\C-a" 'self-insert-command)

(defun viper-save ()
  (interactive)
  (if (eq viper-current-state 'emacs-state)
      (save-buffer)
    (progn
      (viper-exit-insert-state)
      (save-buffer))))

(defun viper-keyboard-quit ()
  (interactive)
  (if (eq viper-current-state 'emacs-state)
      (keyboard-quit)
    (progn
      (viper-exit-insert-state)
      (keyboard-quit))))

(global-set-key "\C-x\C-s" 'viper-save)
(global-set-key "\C-g" 'viper-keyboard-quit)
