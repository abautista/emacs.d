;; These customizations change the way emacs looks and disable/enable
;; some user interface elements

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(setq frame-resize-pixelwise t)
(setq scroll-conservatively most-positive-fixnum)
(ido-mode t)

(custom-set-faces
 '(default ((t
	     (:family "Source Code Pro" :foundry "ADBO" :slant normal :height 105 :width normal)))))
