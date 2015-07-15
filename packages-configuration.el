;;; packages-configuration.el --- config of the packages I use

;;; Commentary:

;; This is my emacs configuration.

;;; Code:
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; packages
(use-package expand-region
  :ensure t
  :bind ("C-o" . er/expand-region))

(use-package highlight-indentation
  :ensure t)

(use-package powerline
  :ensure t
  :config
  (powerline-vim-theme))

(use-package helm
  :ensure t
  :bind (("C-x b" . helm-mini)
	 ("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("M-i" . helm-semantic-or-imenu)
	 ("C-x b" . helm-mini)))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode))

(use-package helm-projectile
  :ensure t
  :bind ("C-p" . helm-projectile)
  :init
  (setq projectile-completion-system 'helm)
  :config
  (helm-projectile-on))
  
(use-package yasnippet
  :ensure t
  :init
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  :config
  (yas-global-mode))

(defun create-snippet (filename)
  "Create a snippet with name FILENAME."
  (interactive "s")
  (let ((mode (symbol-name major-mode)))
    (find-file (format "~/.emacs.d/snippets/%s/%s" mode filename))
    (snippet-mode)))

(global-set-key (kbd "M-'") 'create-snippet)

(use-package company
  :ensure t
  :init
  (setq company-minimum-prefix-length 2
	company-idle-delay 0.1)
  :config
  (add-hook 'prog-mode-hook 'company-mode))

(use-package anaconda-mode
  :ensure t
  :config
  (add-hook 'python-mode-hook 'anaconda-mode))

(use-package company-anaconda
  :ensure t
  :init
  (add-to-list 'company-backends 'company-anaconda))

(use-package flycheck
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'flycheck-mode))

(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'emmet-mode)
  (add-hook 'sghml-mode-hook 'emmet-mode))

(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program "clisp")
  :config
  (slime-setup '(slime-fancy)))

(use-package slime-company
  :ensure t
  :config
  (slime-setup '(slime-company)))

(use-package web-mode
  :ensure t
  :init
  (setq web-mode-enable-current-column-highlight t)
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-hook 'web-mode-hook
	    (function (lambda ()
			(setq web-mode-markup-indent-offset 2)
			(setq web-mode-css-indent-offset)))))

(use-package helm-gtags
  :ensure t
  :init
  (setq
   helm-gtags-ignore-case t
   helm-gtags-auto-update t
   helm-gtags-use-input-at-cursor t
   helm-gtags-pulse-at-cursor t
   helm-gtags-prefix-key "\C-cg"
   helm-gtags-suggested-key-mapping t)
  :config
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  (add-hook 'c++-mode-hook 'helm-gtags-mode)
  (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
  (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
  (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
  (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
  (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history))

(use-package pyenv-mode
  :ensure t)


;;; packages-configuration.el ends here
