;; UserSettings
(setq user-full-name "Yagi2")
(setq user-mail-address "mail@yagi2.com")

;;; common mode
;; tabではなくspaceを使う
(setq indent-tabs-mode nil)
;; インデント幅を4に設定
(setq-default tab-width 4)
;; バッファ最後の行でnext-lineしても新しい行を作らない
(setq next-line-add-newlines nil)

;; C-x tでシェルを起動
(global-set-key (kbd "C-x t") 'shell)

;; c/c++ mode
(add-hook 'c-mode-common-hook
		  '(lambda ()
			 ;; K&Rスタイルを利用する
			 (c-set-style "k&r")
			 ;; インデントにtabではなくspaceを使う
			 (setq indent-tabs-mode nil)
			 ;; インデント幅を4にする
			 (setq c-basic-offset 4)
			 ))

;;; 拡張子によるモードの対応
(setq auto-mode-alist
      (append
	   '(("\\.html$" . html-mode))
       '(("\\.c$" . c-mode))
       '(("\\.h$" . ch-mode))
       '(("\\.cpp$" . c++-mode))
       auto-mode-alist))

;; 最終更新日の自動挿入
;;   ファイルの先頭から 8 行以内に Time-stamp: <Thu Dec 08 21:27:37  2011> または
;;   Time-stamp: " " と書いてあれば、セーブ時に自動的に日付が挿入される

(require 'time-stamp)

;; 日本語で日付を入れたくないのでlocaleをCにする
(defun time-stamp-with-locale-c ()
  (let ((system-time-locale "C"))
    (time-stamp)
    nil))

(if (not (memq 'time-stamp-with-locale-c write-file-hooks))
	(add-hook 'write-file-hooks 'time-stamp-with-locale-c))

(setq time-stamp-format "%3a %3b %02d %02H:%02M:%02S %Z %:y")

;;; 文字コード
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(setq file-name-coding-system 'sjis)
(setq locale-coding-system 'utf-8)

;; テキストエンコーディングとしてUTF-8を優先使用
(prefer-coding-system 'utf-8)

;; C-kでは最後の改行まで削除
(setq kill-whole-line t)

;; Localeに合わせた環境設定
(set-locale-environment nil)
(prefer-coding-system 'utf-8)

;; 終了してもカーソル位置を記録
(when (require 'session nil t)
  (setq session-initialize '(de-saveplace session keys menus places)
        session-globals-include '((kill-ring 50)
                                  (session-file-alist 500 t)
                                  (file-name-history 10000)))
  (setq session-globals-max-string 100000000)
  (setq history-length t)
  (add-hook 'after-init-hook 'session-initialize))

;; "yes or no"を"y or n"に
(fset 'yes-or-no-p 'y-or-n-p)

;; 改行コードを表示
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

;; Beep音を鳴らさない
(setq visible-bell t)

;;ツールバーを削除
(tool-bar-mode 0)

;; フォントのサイズ
(add-to-list 'default-frame-alist '(font . "-outline-Ricty-bold-normal-normal-mono-17-*-*-*-c-*-iso8859-1"))

;; バックアップファイルを作らないようにする
(setq make-backup-files nil)
(setq auto-save-default nil)

;; 画像表示
(auto-image-file-mode t)

;; カーソルのある桁数を表示
(column-number-mode t)

;; カーソル行をハイライト
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background "ForestGreen"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;; タイトルバーにファイル名表示
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))

;; スクロールを１行単位
(setq scroll-step 1)

;; 開始時のメッセージを削除
(setq inhibit-startup-message t)

;; キーバインド
;; コメントアウト
(define-key global-map (kbd "C-c ;") 'comment-dwim)

;; ウィンドウのサイズを決定
(setq default-frame-alist
      (append (list
			   '(width . 150)
			   '(height . 40)
			   '(top . 60)
			   '(left . 140)
               )
              default-frame-alist))
(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t)

;; ウィンドウの色を決定
(if window-system (progn

					;; 文字の色を設定します。
					(add-to-list 'default-frame-alist '(foreground-color . "green"))
					;; 背景色を設定します。
					(add-to-list 'default-frame-alist '(background-color . "black"))
					;; カーソルの色を設定します。
					(add-to-list 'default-frame-alist '(cursor-color . "green"))
					;; マウスポインタの色を設定します。
					(add-to-list 'default-frame-alist '(mouse-color . "white"))
					;; モードラインの文字の色を設定します。
					(set-face-foreground 'modeline "black")
					;; モードラインの背景色を設定します。
					(set-face-background 'modeline "white")
					;; 選択中のリージョンの色を設定します。
					(set-face-background 'region "blue")
					;; モードライン（アクティブでないバッファ）の文字色を設定します。
					(set-face-foreground 'mode-line-inactive "gray30")
					;; モードライン（アクティブでないバッファ）の背景色を設定します。
					(set-face-background 'mode-line-inactive "gray85")
					;; 背景の透過
					(set-frame-parameter nil 'alpha 90)

					))

;; 印刷設定
(require 'cl)
(defun listsubdir (basedir)
  (remove-if (lambda (x) (not (file-directory-p x)))
             (directory-files basedir t "^[^.]")))

; フォントパスを指定
(setq bdf-directory-list
      (listsubdir "c:/emacs/font/intlfonts-1.2.1"))

;; テンプレートを挿入
;;(require 'autoinsert)

; テンプレートのディレクトリ
;;(setq auto-insert-directory "D:/Dropbox/Prog/Template/")

; 各ファイルによってテンプレートの切り替え
;;(add-hook 'find-file-hooks 'auto-insert)
;;(setq auto-insert-alist
;;      (append '(
;;		(c++-mode . "template.cpp")
;;		(c-mode . "template.c")
;;		(html-mode . "template.html")
;;		) auto-insert-alist))

;つぶやきもーど  //APIの仕様変更でつぶやけなくなったので廃止
;;(defun tweet(tweet)
;;(let* ((ruby-script "D:\\yagi2\\.emacs.d\\elisp\\emacs_tweet.rb")
;;	 (shell-char-code 'sjis)
;;	 (tweet (replace-regexp-in-string "\"" "\\\\\"" tweet))
;;	 (command (concat "ruby  -Ku -W0 " ruby-script " \"" (encode-coding-string tweet shell-char-code) "\""))
;;	 (result (shell-command-to-string command)))
;;    (if (equal "" result) 
;;	(message "posted.")
;;      (message result))))

;;(defun tweet-from-minibuffer ()
;;  (interactive)
;;  (let ((tweet (read-from-minibuffer "tweet: ")))
;;    (when tweet 
;;      (message "posting...")
;;      (tweet tweet))))
;;(global-set-key (kbd "C-,") 'tweet-from-minibuffer)

;; 補完プラグイン //変数だけ 辞書使うとくそ重い
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)
