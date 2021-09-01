;;; private-lang/org/+pomodoro.el -*- lexical-binding: t; -*-

(after! org-pomodoro
  (setq org-pomodoro-play-sounds nil)
  (setq org-pomodoro-format "%s")
  (setq org-pomodoro-short-break-format "%s")
  (setq org-pomodoro-long-break-format "%s")
  (setq org-pomodoro-long-break-length 5)
  (add-hook! 'org-pomodoro-started-hook
    (delete 'org-pomodoro-mode-line global-mode-string)
    (delete 'org-mode-line-string global-mode-string))
  )

(defun hoe//pomo-tag-part (tags)
  (if (> (length tags) 2)
      (--> tags
           (substring it 1 -1)
           (s-replace ":" "," it)
           (format "-t %s" it))
    ""
    )
  )

(defun hoe/start-pomo (duration-arg)
  (interactive "sDuration: ")
  (let* ((duration (if (> (length duration-arg) 0) duration-arg "25"))
         (task-components (org-heading-components))
         (task-name (nth 4 task-components))
         (task-tags (nth 5 task-components))
         (cmd-tag-part (hoe//pomo-tag-part task-tags))
         (cmd (format "pomodoro start \"%s\" --duration %s %s" task-name duration cmd-tag-part))
         )
    (shell-command cmd)
    (goto-char (point-max))
    (insert (format "\n*** %s\n" (format-time-string "%Y-%m-%d %H:%M")))
    )
  )
