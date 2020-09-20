;;; private-config/personal/+mru-workspace.el -*- lexical-binding: t; -*-

(defvar hoe/workspaces nil)

(defun hoe/after-switch-project (dir)
  (unless (> (length (persp-buffer-list)) 0)
    (doom-project-find-file dir)
    ))

(setq +workspaces-switch-project-function #'hoe/after-switch-project)
;; (setq +workspaces-switch-project-function #'ignore)
(setq +workspaces-on-switch-project-behavior t)

(after! persp-mode
  (setq hoe/workspaces persp-names-cache)
  (add-hook 'persp-before-switch-functions
            #'(lambda (new-persp-name w-or-f)
                (let ((cur-persp-name (safe-persp-name (get-current-persp)))
                      (nil-persp (car persp-names-cache))
                      (other-persps (cdr persp-names-cache)))
                  (when (member new-persp-name other-persps)
                    (setq persp-names-cache
                          (cons new-persp-name
                                (cons
                                 nil-persp
                                 (delete new-persp-name other-persps))))))))

  (add-hook 'persp-renamed-functions
            #'(lambda (persp old-name new-name)
                (setq persp-names-cache
                      (cons
                       (car persp-names-cache)
                       (cons
                        new-name
                        (delete new-name (cdr persp-names-cache)))))))

  (add-hook 'persp-before-kill-functions
            #'(lambda (persp)
                (setq persp-names-cache
                      (delete (safe-persp-name persp) persp-names-cache))))

  (add-hook 'persp-created-functions
            #'(lambda (persp phash)
                (when (and (eq phash *persp-hash*)
                           (not (member (safe-persp-name persp)
                                        persp-names-cache)))
                  (setq persp-names-cache
                        (cons
                         (car persp-names-cache)
                         (cons
                          (safe-persp-name persp)
                          (cdr persp-names-cache))))))))

(defvar hoe/custom-project-list)
(setq hoe/custom-project-list
  '(
    "funkenschlag/client"
    "funkenschlag/server"
    "funkenschlag/arbiter"
    "substratekitties/runtime"
    "mockingbird/mirai-client"
    "mockingbird/main"
    ))

(defun hoe/projectile-project-name (project-root)
  "Function to create project name"
  (let ((custom-project-name (-find #'(lambda (str) (string-match str project-root)) hoe/custom-project-list)))
    (or custom-project-name (projectile-default-project-name project-root))))

(setq projectile-project-name-function 'hoe/projectile-project-name)
