# alias
function dg
	df -g
end

function more
	less
end

function ipconfig
	ifconfig
end

function x
	exit
end

function sl
	ls
end

function ks
	ls
end

function emacs
	/Applications/Emacs.app/Contents/MacOS/Emacs
end

# function   end
# Prompt
function fish_prompt --description 'Write out the prompt'
  set -l last_status $status

  # User
  set_color $fish_color_user
  echo -n (whoami)
  echo -n '@'
  set_color normal

  # Host
  set_color $fish_color_host
  echo -n (hostname -s)
  set_color normal

  echo -n ':'

  # PWD
  set_color $fish_color_cwd
  echo -n "["
  echo -n (pwd)
  echo -n "]"
  echo -n " 🐤  "
  set_color normal

  __terlar_git_prompt
  echo

  if not test $last_status -eq 0
  set_color $fish_color_error
  end

  echo -n '$ '
  set_color normal
end