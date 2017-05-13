;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1e67765ecb4e53df20a96fb708a8601f6d7c8f02edb09d16c838e465ebe7f51b" default)))
 '(ecb-layout-name "left9")
 '(ecb-layout-window-sizes nil)
 '(ecb-options-version "2.50")
 '(package-selected-packages
   (quote
    (virtualenvwrapper ecb magit better-defaults py-autopep8 material-theme flycheck elpy projectile ##)))
 '(safe-local-variable-values (quote ((eval venv-workon "sushi_env")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq split-width-threshold 0)
(setq backup-directory-alist `(("." . "~/.saves")))

(setq backup-directory-alist
          `((".*" . , "~/.backups")))
(setq auto-save-file-name-transforms
          `((".*" , "~/.backups" t)))

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
                    '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
    (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    elpy
    flycheck
    py-autopep8
    magit
    dashboard
    virtualenvwrapper
    material-theme
    projectile
    flycheck
    neotree
    ecb))

(mapc #'(lambda (package)
              (unless (package-installed-p package)
                      (package-install package)))
            myPackages)


(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

(global-set-key (kbd "C-x g") 'magit-status)

;; Awesome Dashboard with startup on load
(require 'dashboard)
(dashboard-setup-startup-hook)

(global-auto-revert-mode t)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
;;(load-theme 'monokai t) ;; load material theme

;; Line configuration
(global-linum-mode t) ;; enable line numbers globally
(setq linum-format "%4d \u2502 ")

(elpy-enable)
;;(elpy-use-ipython)

(global-flycheck-mode)

(global-set-key (kbd "C-x g") 'magit-status)

(when (require 'flycheck nil t)
   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Neo Tree -> F8
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; Projectile (thank you!)
(require 'projectile)
(projectile-global-mode)

(progn (global-set-key [escape] 'keyboard-quit))

;; Dired
(require 'dired-x)
(setq dired-omit-files
      (rx (or (seq bol (? ".") "#")         ;; emacs autosave files
              (seq "~" eol)                 ;; backup-files
              (seq bol "svn" eol)           ;; svn dirs
              (seq ".pyc" eol)
              )))
(setq dired-omit-extensions
      (append dired-latex-unclean-extensions
              dired-bibtex-unclean-extensions
              dired-texinfo-unclean-extensions))

(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))
(put 'dired-find-alternate-file 'disabled nil)

(setq split-height-threshold nil)
(setq split-width-threshold 0)

;;(setq redisplay-dont-pause t
;;      scroll-margin 1
;;      scroll-step 1
;;      scroll-conservatively 10000
;;      scroll-preserve-screen-position 1)


;; ECB -> C-c e
(require 'ecb)
(global-set-key (kbd "C-c e") 'ecb-activate)
(global-set-key (kbd "C-c d") 'ecb-deactivate)
(setq ecb-tip-of-the-day nil)

(setq ecb-windows-width 40
      ecb-fix-window-size 'width)

;; Custom highlighting row
(global-hl-line-mode 1)
(set-face-background 'hl-line "#52595b")
(set-face-foreground 'highlight nil)

;; Back copy/paste buffer global and override hotkeys
(defun pbcopy ()
     (interactive)
          (call-process-region (point) (mark) "pbcopy")
                 (setq deactivate-mark t))

(defun pbpaste ()
     (interactive)
          (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

(defun pbcut ()
     (interactive)
          (pbcopy)
                 (delete-region (region-beginning) (region-end)))

(global-set-key (kbd "C-c c") 'pbcopy)
(global-set-key (kbd "C-c C-c") 'pbcopy)
(global-set-key (kbd "C-c v") 'pbpaste)
(global-set-key (kbd "C-c x") 'pbcut)

(defun copy-from-osx ()
     (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
     (let ((process-connection-type nil))
     (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
     (process-send-string proc text)
     (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;; Bind whole line copy on C-c k
(defun copy-line (arg)
         "Copy lines (as many as prefix argument) in the kill ring"
         (interactive "p")
         (kill-ring-save (line-beginning-position)
         (line-beginning-position (+ 1 arg)))
         (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(global-set-key (kbd "C-c k") 'copy-line)

;; Rebind home/end keyes
(global-set-key [home] 'move-beginning-of-line)
(global-set-key [end] 'move-end-of-line)

(set-default-font "Monaco-13")

;; Set default window size 70*240
(add-to-list 'default-frame-alist '(height . 70))
(add-to-list 'default-frame-alist '(width . 240))

;; Configure virtualenvwrapper
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location "~/.virtualenvs/")
(setq projectile-switch-project-action 'venv-projectile-auto-workon)
(setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format))
