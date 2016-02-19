(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;;;;
;; Packages I use
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

;;;;
;; Customizations
;;;;

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(ido-mode t)
(setq frame-resize-pixelwise t)

(global-set-key (kbd "C-x C-g") 'deft)

(custom-set-faces
 '(default ((t
	     (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight semi-bold :height 105 :width normal)))))

;; Org mode customizations

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-directory "~/.org")
(setq org-default-notes-file "~/.org/refile.org")

(setq org-agenda-files (list
			"~/.org/todo.org"
			"~/.org/tutorials.org"
			"~/.org/courses.org"
			"~/.org/books.org"
			"~/.org/english.org"
			"~/.org/handmade.org"))

;;;;
;; Language specific
;;;;

;; For editing c/c++
(defun abautista-c-mode-common-hook()
  (setq tab-width 4
	indent-tabs-mode nil)
  (setq c-basic-offset 4))

(add-hook 'c-mode-common-hook 'abautista-c-mode-common-hook)
