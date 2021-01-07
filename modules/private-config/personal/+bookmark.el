;;; private-config/personal/+bookmark.el -*- lexical-binding: t; -*-

;; https://gist.github.com/gilbertw1/9fe4f6380fb0c95e38e30fdff2dfb6fb
(defun counsel-projectile-bookmark ()
    "Forward to `bookmark-jump' or `bookmark-set' if bookmark doesn't exist."
    (interactive)
    (require 'bookmark)
    (let ((projectile-bookmarks (projectile-bookmarks)))
      (ivy-read "Create or jump to bookmark: "
                projectile-bookmarks
                :action (lambda (x)
                          (cond ((and counsel-bookmark-avoid-dired
                                      (member x projectile-bookmarks)
                                      (file-directory-p (bookmark-location x)))
                                 (with-ivy-window
                                   (let ((default-directory (bookmark-location x)))
                                     (counsel-find-file))))
                                ((member x projectile-bookmarks)
                                 (with-ivy-window
                                   (bookmark-jump x)))
                                (t
                                 (bookmark-set x))))
                :caller 'counsel-projectile-bookmark)))

(after! ivy
  (ivy-set-actions
   'counsel-projectile-bookmark
   '(("D" bookmark-delete "delete")
     ("e" bookmark-rename "edit"))))

  (defun projectile-bookmarks ()
    (let ((bmarks (bookmark-all-names)))
      (cl-remove-if-not #'workspace-bookmark-p bmarks)))

  (defun workspace-bookmark-p (bmark)
    (let ((bmark-path (expand-file-name (bookmark-location bmark))))
      (string-prefix-p (projectile-project-root) bmark-path)))
