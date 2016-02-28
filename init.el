(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;;;;
;; Packages
;;;;

(use-package paredit
  :ensure t)

(use-package deft
  :ensure t
  :config
  (setq deft-default-extension "org"))

(use-package caroline-theme
  :ensure t)

(use-package company
  :ensure t
  :init
  (setq company-minimum-prefix-length 3)
  (setq company-idle-delay 0.2)
  :config
  (global-company-mode))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  (defvar company-mode/enable-yas t
    "Enable yasnippet for all backends")
  (defun company-mode/backend-with-yas (backend)
    (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
	backend
      (append (if (consp backend) backend (list backend))
	      '(:with company-yasnippet))))
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/snippets")))

;; Add a directory to our load path, so when you `load` things below,
;; emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;;;;
;; Customizations
;;;;

;; User interface elements
(load "ui.el")

;; These customizations make editing a bit nicer
(load "editing")

;; Org mode customizations
(load "org.el")

;; Hard to categorize customizations
(load "misc.el")

;; Language specific
(load "languages.el")
