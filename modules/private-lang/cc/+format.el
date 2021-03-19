;;; private-lang/cc/+format.el -*- lexical-binding: t; -*-

;; https://stackoverflow.com/questions/39894233/extract-emacs-c-style-options-from-clang-format-style/55784057#55784057
(use-package! clang-format
  :after (s)
  :init
  (defun get-clang-format-option (config-str field is-num)
    "Retrieve a config option from a clang-format config.

CONFIG-STR is a string containing the entire clang-format config.
FIELD is specific option, e.g. `IndentWidth'.  IS-NUM is a
boolean that should be set to 1 if the option is numeric,
otherwise assumed alphabetic."
    (if is-num
        (let ((primary-match (s-match (concat "^" field ":[ \t]*[0-9]+") config-str)))
          (if primary-match
              (string-to-number (car (s-match "[0-9]+" (car primary-match))))
            0))
      (let ((primary-match (s-match (concat "^" field ":[ \t]*[A-Za-z]+") config-str)))
        (if primary-match
            (car (s-match "[A-Za-z]+$" (car primary-match)))
          ""))))
  :hook (c-mode-common . (lambda ()
                           (let* ((clang-format-config
                                   (shell-command-to-string "clang-format -dump-config"))
                                  (c-offset (get-clang-format-option clang-format-config "IndentWidth" t))
                                  (tabs-str (get-clang-format-option clang-format-config "UseTab" nil))
                                  (base-style
                                   (get-clang-format-option clang-format-config "BasedOnStyle" nil)))
                             (progn
                               (if (> c-offset 0)
                                   (setq-local c-basic-offset c-offset)
                                 (if (not (equal "" base-style))
                                     (cond ((or (equal "LLVM" base-style)
                                                (equal "Google" base-style)
                                                (equal "Chromium" base-style)
                                                (equal "Mozilla" base-style))
                                            (setq-local c-basic-offset 2))
                                           ((equal "WebKit" base-style)
                                            (setq-local c-basic-offset 4)))))
                               (if (not (equal "" tabs-str))
                                   (if (not (string-equal "Never" tabs-str))
                                       (setq-local indent-tabs-mode t)
                                     (setq-local indent-tabs-mode nil))
                                 (if (not (equal "" base-style))
                                     (cond ((or (equal "LLVM" base-style)
                                                (equal "Google" base-style)
                                                (equal "Chromium" base-style)
                                                (equal "Mozilla" base-style)
                                                (equal "WebKit" base-style))
                                            (setq-local indent-tabs-mode nil))))))))))
