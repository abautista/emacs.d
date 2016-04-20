;; These customizations change the way emacs looks and disable/enable
;; some user interface elements

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(setq inhibit-startup-message t)
(setq frame-resize-pixelwise t)
(setq scroll-conservatively most-positive-fixnum)

;; font
(custom-set-faces
 '(default ((t
	     (:family "Source Code Pro" :foundry "ADBO" :slant normal :height 105 :width normal)))))

;; no auto save files
(setq auto-save-default nil)
(setq make-backup-files nil)

;; global keybindings
(global-set-key (kbd "M-o") 'other-window)

(global-set-key (kbd "<f8>") 'first-error)
(global-set-key (kbd "<f7>") 'previous-error)
(global-set-key (kbd "<f9>") 'next-error)
