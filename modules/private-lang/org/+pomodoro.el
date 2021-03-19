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
