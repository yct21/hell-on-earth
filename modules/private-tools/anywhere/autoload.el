;;; private-tools/anywhere/autoload.el -*- lexical-binding: t; -*-


;;;###autoload
(defun hoe-anywhere//alfred-trigger (content)
  (let ((trigger (if hoe-anywhere//use-special-form "input-special" "input-normal"))
        (pattern "tell application id \"com.runningwithcrayons.Alfred\" to run trigger \"%s\" in workflow \"com.alfredapp.yct21.emacsanywhere\"\
with argument \"%s\""))
    (format pattern trigger content)))

;;;###autoload
(defun hoe-anywhere/on-close (_window)
  (let ((content (buffer-string)))
    (do-applescript (hoe-anywhere//alfred-trigger content)))
  t
  )

;;;###autoload
(defun hoe-anywhere/open (special)
  (let ((buffer (get-buffer-create "*hoe/anywhere*")))
    (setq hoe-anywhere//use-special-form special)
    (pop-to-buffer buffer)
    (erase-buffer)
    (evil-insert-state)
    (call-process "fcitx-remote" nil nil nil "-c"))
  )
