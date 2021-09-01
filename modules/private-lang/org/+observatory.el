;;; private-lang/org/+observatory.el -*- lexical-binding: t; -*-

;;;###autoload
(defun hoe-observatory/insert-footnote (footnote-description)
  (interactive "sFootnote description: ")
  (let ((footnote (s-dashed-words footnote-description)))
    (insert (format "[fn:%s] " footnote))
    (+insert-chrome-url/insert-chrome-current-tab-url-in-org footnote-description)
    )
  )

;;;###autoload
(defun hoe-observatory/org-hide-properties-display ()
  "Hide Org property drawer using text properties.
Based on the code shared at
https://org-roam.discourse.group/t/org-roam-major-redesign/1198/34."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward
            "^ *:PROPERTIES:\n\\( *:.+?:.*\n\\)+ *:END:\n" nil t)
      (add-text-properties (match-beginning 0) (match-end 0)
                           (list 'display "📖\n\n")))))

;;;###autoload
(defun hoe-observatory/org-show-properties-display ()
  "Show Org property drawer using text properties.
Based on the code shared at
https://org-roam.discourse.group/t/org-roam-major-redesign/1198/34."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward
            "^ *:PROPERTIES:\n\\( *:.+?:.*\n\\)+ *:END:\n" nil t)
      (remove-list-of-text-properties (match-beginning 0) (match-end 0)
                           (list 'display
                                 'line-prefix)))))
