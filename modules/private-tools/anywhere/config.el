;;; private-tools/anywhere/config.el -*- lexical-binding: t; -*-

(setq-default hoe-anywhere//use-special-form nil)

(set-popup-rule!
  "\*hoe/anywhere\*"
  :select t
  :modeline nil
  :quit #'hoe-anywhere/on-close
  )

