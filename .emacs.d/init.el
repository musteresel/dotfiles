;;;; Emacs startup configuration



;;; Basic Emacs config
(setq inhibit-startup-message t)
(transient-mark-mode)
(delete-selection-mode)
(column-number-mode)
(show-paren-mode)
(which-function-mode)
(tool-bar-mode -1)



;;; Bootstrap use-package, setting up package.el along the way
(require 'package)
(setq package-enable-at-startup nil) ; DON'T autorun package-initialize...
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize) ; ... run it NOW
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(require 'bind-key)


;;; Autocompletion
(use-package company
  :ensure t
  :config (global-company-mode))


;;; Auto resize windows to make life easier
(use-package golden-ratio
  :ensure t
  :config
  (golden-ratio-mode 1))


;;; Nobody likes wide text
(use-package column-enforce-mode
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'column-enforce-mode)
  (setq column-enforce-column 80))


;;; Use helm to direct me
(use-package helm
  :ensure t
  :config
  (require 'helm-config)
  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))
  (global-set-key (kbd "M-x") 'helm-M-x)
  (setq helm-M-x-fuzzy-match t)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (setq helm-buffers-fuzzy-matching t
	helm-recentf-fuzzy-match t)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-c h o") 'helm-occur)
  (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-z") 'helm-select-action)
  (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)
  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))
  (helm-mode 1))


