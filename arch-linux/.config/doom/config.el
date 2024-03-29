;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Splash Screen
(setq fancy-splash-image
      (expand-file-name "I-am-doom.png" doom-user-dir))

;; Copy/Paste utilities
(defun copy-buffer-file-name-to-kill-ring ()
  "Send the current name of the buffer to the kill ring"
  (interactive)
  (kill-new (buffer-file-name)))

;; For those times that I somehow enter vim
;; from a vterm session in emacs :)
;; "Do Not Evil"
(map! :leader
      "d n e" #'turn-off-evil-mode)

;; Windows
;; Maximize/Minimize a window
(map! :leader
      "z" #'zoom-window-zoom)

;; Helix-like
;;; Evil start of line
(map! :n
      "g h" #'evil-beginning-of-visual-line)

;;; Evil end of line
;;; NOTE: 'g l' is already mapped natively to something else, so this overrides it
(map! :after evil
      :nv
      "g l" #'evil-end-of-visual-line)

;;; Rename symbol
(map! :leader
      "r" #'lsp-rename)

;;; Easier way to comment lines
(map! :after evil
      :nv
      "c c" #'evilnc-comment-or-uncomment-lines)

;;; Next/Previous git diff
;;; NOTE: natively this is ] d, I'm just used to the helix keybindings
;;; and I don't want to re-adapt :)
(map! :after evil
      :nv
      "] g" #'+vc-gutter/next-hunk)

(map! :after evil
      :nv
      "[ g" #'+vc-gutter/previous-hunk)

;; Python stuff
(global-tree-sitter-mode)

;; TODO: This feels a bit heavy handed?
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(setq python-shell-interpreter "ipython")
(setq python-shell-interpreter-args "-i --simple-prompt")

;; Styling
(setq doom-font
      (font-spec :family "Fira Code" :size 11 :weight 'bold))

(setq doom-unicode-font
      (font-spec :family "Fira Code" :size 11 :weight 'bold))

(setq doom-theme 'doom-dracula)

;; Cursor
(setq evil-normal-state-cursor '(bar "tan1")
      evil-insert-state-cursor '(bar "SeaGreen1")
      evil-visual-state-cursor '(hbar "turquoise1"))

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
; (setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
