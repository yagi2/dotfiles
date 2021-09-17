package 'git'

directory "#{node[:home]}/github.com/"

dotfile '.gitconfig'
dotfile '.gitignore'

dotfile '.git_template/hooks/post-checkout'