;;; private-lang/org/+peregrine.el -*- lexical-binding: t; -*-

;;;###autoload
(defun hoe-peregrine/create-task (title)
  (interactive "sTitle: ")
  (let* ((filename (--> title
                        (split-string it)
                        (string-join it "-")
                        (downcase it)))
         (timestamp (format-time-string "%Y%m%d%H%M%S"))
         (filepath (format "%s/%s-%s.org"
                           hoe/peregrine
                           timestamp
                           filename)))
    (find-file filepath)
    (erase-buffer)
    (insert (format "* TODO %s"
                    title))))
