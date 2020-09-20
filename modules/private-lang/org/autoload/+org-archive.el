;;; private-lang/org/autoload/+org-archive.el -*- lexical-binding: t; -*-

;;;###autoload
(defun hoe/archive-todo-file ()
  (interactive)
  (doom/move-this-file "./archived/"))
