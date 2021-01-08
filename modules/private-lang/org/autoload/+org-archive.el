;;; private-lang/org/autoload/+org-archive.el -*- lexical-binding: t; -*-

;;;###autoload
(defun hoe/archive-todo-file ()
  (interactive)
  (evil-goto-first-line)
  (org-todo "DONE")
  (doom/move-this-file "./archived/")
  (kill-current-buffer)
  (kill-current-buffer)
  )
