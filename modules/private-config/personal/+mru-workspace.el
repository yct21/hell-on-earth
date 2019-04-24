;;; private-config/personal/+mru-workspace.el -*- lexical-binding: t; -*-

(setq +workspaces-switch-project-function #'ignore)

(after! persp-mode
  (add-hook 'persp-before-switch-functions
            #'(lambda (new-persp-name w-or-f)
                (let ((cur-persp-name (safe-persp-name (get-current-persp)))
                      (nil-persp (car persp-names-cache))
                      (other-persps (cdr persp-names-cache)))
                  (when (member new-persp-name other-persps)
                    (setq persp-names-cache
                          (cons nil-persp
                                (cons
                                 new-persp-name
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
