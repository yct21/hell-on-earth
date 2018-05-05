;;; private/elisp/config.el -*- lexical-binding: t; -*-

(def-package! lispyville
  :hook ((emacs-lisp-mode) . lispyville-mode)
  :config

  ;; Prettify when save
  (add-hook 'emacs-lisp-mode-hook
            #'(lambda () (add-hook 'before-save-hook
                                   #'(lambda () (lispyville-prettify (point-min) (point-max))))))
  (lispyville-set-key-theme
   `(operators
     prettify))
  (elisp/define-keybindings))

(defun elisp/define-keybindings ()
  "Define keybindings for lispyville"
  (map! :map emacs-lisp-mode-map
        :n "A" #'lispyville-insert-at-end-of-list
        :n "I" #'lispyville-insert-at-beginning-of-list
        (:localleader
          :desc "Drag forward" :n "j" #'lispyville-drag-forward
          :desc "Drag backward" :n "k" #'lispyville-drag-backward
          :desc "Barf" :n "<" #'lispyville-barf
          :desc "Slurp" :n ">" #'lispyville-slurp
          :desc "Join" :n "J" #'lispy-join
          :desc "Splice" :n "s" #'lispy-splice
          :desc "Split" :n "S" #'lispy-split
          :desc "Raise" :n "r" #'lispy-raise
          :desc "Raise list" :n "R" #'lispyville-raise-list
          :desc "Transpose" :n "t" #'transpose-sexps
          :desc "Convolute" :n "v" #'lispy-convolute-sexp)))
