;;; init.el

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Convenient Customizations
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(defvar js2-indent 2)
(defvar web-mode-indent 2) ;; this includes jsx
(defvar sql-indent 4)

;; 80-column rule for text files
(setq-default fill-column 68)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Set-up display
(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(display-time-mode 1) ; display time
(display-battery-mode 1) ; display batter
;;(set-scroll-bar-mode 'right) ; scroll bar does not appear properly in 1440p
(scroll-bar-mode -1) ; disable scrollbar on all frames
(toggle-scroll-bar -1) ; disable scrollbar
(setq use-dialog-box nil) ; disable pop-up dialog boxes
(setq echo-keystrokes 0.1) ; remove beeping noise
(setq visible-bell t) ; bell displaying command error

(tooltip-mode nil)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message "Ivan Manan")

;; Every minibuffer will be split vertically
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;; moves deleted files to trash
(setq delete-by-moving-to-trash t)

;; Makes *scratch* empty.
(setq initial-scratch-message "\n\n\nHello Ivan!\nThis is your scratch\n\n\n")

;; Removes *scratch* from buffer after the mode has been set.
;; (defun remove-scratch-buffer ()
;;   (if (get-buffer "*scratch*")
;;       (kill-buffer "*scratch*")))
;; (add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
          '(lambda ()
             (let ((buffer "*Completions*"))
               (and (get-buffer buffer)
                    (kill-buffer buffer)))))

;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

(defalias 'yes-or-no-p #'y-or-n-p) ; switches yes-no to y-n

;; Every new frame will be maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; matching parentheses
(setq show-paren-delay 0)
(show-paren-mode 1)
(defadvice show-paren-function
    (after show-matching-paren-offscreen activate)
  "If the matching paren is offscreen, show the matching line in the
    echo area. Has no effect if the character before point is not of
    the syntax class ')'."
  (interactive)
  (let* (
         (cb (char-before (point)))
         (matching-text (and cb
                             (char-equal (char-syntax cb) ?\) )
                             (blink-matching-open)
                             )
                        )
         )))

;; delete all trailing whitespaces
(set 'delete-trailing-lines nil) ;; this does not remove trailing new lines
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; do not view trailing empty lines
(setq-default indicate-empty-lines nil)

;; remove back-up files
;; (setq make-backup-files nil)
;; (setq auto-save-default nil)

;; store all back-up files in the tmp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; replace active region by typing text
(delete-selection-mode 1)

;; auto-complete paired brackets
(electric-pair-mode 1)

;; cut command only works on highlighted region
(setq mark-even-if-inactive nil)

;; copy from outside buffer into kill ring
(setq save-interprogram-paste-before-kill t)

;; enable flyspell on .txt files
(add-hook 'text-mode-hook 'flyspell-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Custom Views and Saves
(setq mode-require-final-newline nil) ; no newline at end of file

;; scrolling
(setq scroll-error-top-bottom t)
;(setq next-screen-context-lines 5)
(setq scroll-preserve-screen-position t) ; point remains same position
(setq recenter-positions '(top middle)) ; show top and middle
(setq-default word-wrap t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Shell Mode

;; Continue scrolling after clearing screen
(remove-hook 'comint-output-filter-functions
             'comint-postoutput-scroll-to-bottom)

;; Do not confirm exiting shell processes
(add-hook 'comint-exec-hook
          (lambda () (set-process-query-on-exit-flag (get-buffer-process (current-buffer)) nil)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Initialize Packages
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; winner mode
;; resets windows configuration, such as split screens
;; Press C-c left or C-c right
(when (fboundp 'winner-mode)
      (winner-mode 1))

;; ido
(require 'ido)
(ido-mode t)
(require 'ido-vertical-mode)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; ido does not prompt for creating new buffer
(setq ido-create-new-buffer 'always)

;; ido vertical mode
(setq ido-use-faces t)
(ido-vertical-mode 1)

;; ido sort files by modification time
;; (ido-sort-mtime-mode 1) ;; there is an error here!!

;; order for ido to sort files
;;(setq ido-file-extensions-order '(".js" ".jsx" ".html" ".css" ".cpp" ".c" ".txt" ".emacs" ".el" ".cfg" ".cnf"))

;; flycheck
(require 'flycheck)
(global-flycheck-mode t)

;; auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)
(set-face-attribute 'ac-candidate-face nil
                    :background "silver")
(set-face-attribute 'ac-candidate-mouse-face nil
                    :background "dimgray")
(set-face-attribute 'ac-completion-face nil
                    :background nil
                    :foreground "green")
(set-face-attribute 'ac-selection-face nil
                    :background "lightcyan"
                    :foreground "black")

;; js2-mode - JS syntax checker
(require 'js2-mode)
(setq js2-mode-show-parse-errors nil) ; flycheck override
(setq js2-mode-show-strict-warnings nil) ; flycheck override

;; tern mode
;; $ sudo npm install -g tern
;; M-. -- goes to function declaration
;(require 'tern)

;; (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
;; (eval-after-load 'tern
;;    '(progn
;;       (require 'tern-auto-complete)
;;       (tern-ac-setup)))
(add-hook 'js2-mode-hook (lambda () (setq js2-basic-offset js2-indent)))

;; anzu - displays total searches
(global-anzu-mode +1)
(set-face-attribute 'anzu-mode-line nil
                    :foreground "black" :weight 'bold)

;; smex - auto-complete M-x commands
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ; old M-x

;; delay smex
(global-set-key [(meta x)] (lambda ()
                             (interactive)
                             (or (boundp 'smex-cache)
                                 (smex-initialize))
                             (global-set-key [(meta x)] 'smex)
                             (smex)))

(global-set-key [(shift meta x)] (lambda ()
                                   (interactive)
                                   (or (boundp 'smex-cache)
                                       (smex-initialize))
                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                   (smex-major-mode-commands)))
;; smex: insert hyphen instead of a space
(defadvice smex (around space-inserts-hyphen activate compile)
  (let ((ido-cannot-complete-command
         `(lambda ()
            (interactive)
            (if (string= " " (this-command-keys))
                (insert ?-)
              (funcall ,ido-cannot-complete-command)))))
    ad-do-it))

;; undo-tree
;; M-x undo-tree-visualize: displays undo tree
(require 'undo-tree)
(global-undo-tree-mode t)

;; swiper
(require 'swiper)
(set-face-attribute 'swiper-line-face nil
                    :background "darkred")

;; avy
(require 'avy)

;; markdown-mode
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; Future Installment:
;; I would like to be able to jump to variable/function definitions in C++
;; As of now, I can only do this in Javascript with Tern-mode key binding M-.

;; tramp-mode
(require 'tramp)
(setq tramp-default-method "ssh")

;; diminish
;; hide minor modes in mode line
(require 'diminish)
(diminish 'undo-tree-mode)
(diminish 'smex-mode)
(diminish 'anzu-mode)
(diminish 'flycheck-mode)
(diminish 'flyspell-mode)
(diminish 'auto-complete-mode)
;(diminish 'tern-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Key bindings

;; C-z as undo, C-/ as go to line number, C-x u undo-tree-visualize
(global-set-key (kbd "C-z") 'undo-tree-undo)
(global-set-key (kbd "C-S-z") 'undo-tree-redo)
(eval-after-load 'undo-tree
  '(progn
     (define-key undo-tree-map (kbd "C-_") 'goto-line)
     (define-key undo-tree-map (kbd "C-/") 'avy-goto-char) ; can be change to 2 char
     (define-key undo-tree-map (kbd "C-?") nil)
     (define-key undo-tree-map (kbd "M-_") nil)))

;; C-v, M-v views changed to scrolling
;; end-of-buffer commented so point does not move while scrolling
(global-set-key (kbd "C-v") (lambda () (interactive) (scroll-up 8)))
                              ;(end-of-buffer (goto-char (point-max)))))
(global-set-key (kbd "M-v") (lambda () (interactive) (scroll-down 8)))
                              ;(end-of-buffer (goto-char (point-max)))))

;; Disable <Insert> button
(global-set-key (kbd "<insert>") nil)

;; C-x k asks to kill all buffers
(global-set-key (kbd "C-x k") 'kill-some-buffers)

;; C-' open and close neotree
(global-set-key (kbd "C-'") 'dired-other-window)

;; C-<TAB> as switch between windows
(global-set-key (kbd "C-<tab>") 'other-window)

;; C-r as swiper
(global-set-key (kbd "C-r") 'swiper)

(global-set-key (kbd "M-m") 'compile)
(global-set-key (kbd "M-s") 'shell)

;; C-; as comment whole line
(global-set-key (kbd "C-;") 'comment-line)

;; <f1>, <f2> navigate locus of error message
(global-set-key (kbd "<f2>") 'next-error)
(global-set-key (kbd "<f1>") 'previous-error)

;; C-x g magit-status
(global-set-key (kbd "C-x g") 'magit-status)

;; C-q disabled
(global-unset-key (kbd "C-q"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Replace kill with delete
(defun delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (if (use-region-p)
      (delete-region (region-beginning) (region-end))
    (delete-region (point) (progn (forward-word arg) (point)))))

(defun backward-delete-word (arg)
  "Delete characters backward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (delete-word (- arg)))

(defun delete-whole-line ()
  "Delete whole line and do not copy into kill-ring."
  (interactive)
  (delete-region
   (move-beginning-of-line 1)
   (save-excursion (move-end-of-line 1) (point)))
  (delete-char 1)
)

(global-set-key (read-kbd-macro "M-<DEL>") 'backward-delete-word)
(global-set-key (read-kbd-macro "M-d") 'delete-word)
(global-set-key (kbd "C-k") 'delete-whole-line)

;; backward-delete-word works for ido mode
(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map (kbd "M-<DEL>")
              'ido-delete-backward-word-updir)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Programming Languages

;; C++, C
(defun my-c-mode-common-hook ()
  (c-set-offset 'substatement-open 0)
  (setq c++-tab-always-indent t)
  (setq c-basic-offset 4)
  (setq c-indent-level 4)

  (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
  (setq tab-width 4)
  (setq indent-tabs-mode t)  ; switching to nil uses spaces
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(setq web-mode-enable-auto-pairing t) ; auto-pairing
(setq web-mode-enable-css-colorization t) ; css colorization
(setq web-mode-enable-current-element-highlight t) ; highlight HTML tags
(set-face-attribute 'web-mode-current-element-highlight-face nil
                    :background "cyan")

;; json run in web-mode
(add-to-list 'auto-mode-alist '("\\.json\\'" . web-mode))
(set-face-attribute 'web-mode-json-key-face nil
                    :foreground "#A52A2A"
                    :weight 'bold)
(set-face-attribute 'web-mode-json-string-face nil
                    :foreground "#2E3436")

;; jsx run in web-mode
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-hook 'web-mode-hook (lambda () (if (equal web-mode-content-type "javascript")
                                        (web-mode-set-content-type "jsx") (message "now set to: %s" web-mode-content-type))))
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset web-mode-indent)
  (setq web-mode-code-indent-offset web-mode-indent)
  (setq web-mode-indent-style web-mode-indent)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; jade mode
(require 'jade-mode)
;; To change Jade mode indentations:
;; open ~/.emacs.d/elpa/jade-mode-1.0.0/jade-mode.el
;; set the indent-tabs-mode variable t
;; set the jade-tab-width to however many spaces

;; sql mode
(add-hook 'sql-mode-hook 'my-sql-mode-hook)
(defun my-sql-mode-hook ()
  (add-hook 'hack-local-variables-hook
            (lambda () (setq indent-tabs-mode nil) (setq tab-width sql-indent) )))

;; JavaScript: Choose web-mode or js2 mode
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Adwaita Themed Colors
(add-hook 'after-init-hook (lambda () (load-theme 'adwaita)))

(set-face-attribute 'ido-first-match nil
                    :background nil
                    :foreground "red")
(set-face-attribute 'ido-subdir nil
                    :foreground "blue")
(set-face-attribute 'ido-only-match nil
                    :background nil
                    :foreground "medium sea green")

;; To find list of faces, use:
;; M-x list-faces-display
(set-face-attribute 'minibuffer-prompt nil
                    :foreground "black")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Emacs Server
(desktop-save-mode 1) ; save emacs desktop session
(server-start)

;;; init.el ends here

