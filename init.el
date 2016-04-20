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

;; project interaction library for Emacs
(use-package projectile
  :ensure t
  :config
  (projectile-global-mode))

;; text completion framework for Emacs
(use-package company
  :ensure t
  :init
  (setq company-minimum-prefix-length 3)
  (setq company-idle-delay 0.2)
  :config
  (global-company-mode))

;; a package in a league of it own
(use-package helm
  :ensure t
  :init
  (helm-mode 1)
  :bind
  ("C-x b" . helm-mini)
  ("M-j" . helm-imenu)
  ("C-x C-f" . helm-find-files)
  ("M-x" . helm-M-x)
  ("M-y" . helm-show-kill-ring)
)

;; mode for quickly browsing and editing plain notes
(use-package deft
  :ensure t
  :bind ("C-x C-g" . deft)
  :config
  (setq deft-default-extension "org"))

;; color-theme
(use-package caroline-theme
  :ensure t)

;; Add a directory to our load path, so when you `load` things below,
;; emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;;;;
;; Customizations
;;;;

;; User interface elements
(load "ui.el")

;; Org mode customizations
(load "org-customizations.el")

;; Language specific
(load "languages.el")
