;; Language specific customizations

;; For editing c/c++
(defun abautista-c-mode-common-hook()
  (setq tab-width 4
	indent-tabs-mode nil)
  (setq c-basic-offset 4))

(add-hook 'c-mode-common-hook 'abautista-c-mode-common-hook)

