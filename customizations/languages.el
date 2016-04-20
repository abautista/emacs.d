;; Language specific customizations

;; Handmade Hero style for coding in C
(defconst handmade-hero-c-style
  '((c-basic-offset . 4)
    (c-echo-syntactic-information-p . t)
    (c-offsets-alist . ((substatement-open . 0))))
  "Handmade Hero C Syle")

(c-add-style "handmade" handmade-hero-c-style)

;; Customizations for all modes in CC mode
(defun abautista-c-mode-common-hook()
  (local-set-key (kbd "<f12>") 'projectile-find-other-file)
  (setq tab-width 4
	indent-tabs-mode nil))

(add-hook 'c-mode-common-hook 'abautista-c-mode-common-hook)
