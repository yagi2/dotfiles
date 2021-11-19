package 'git'

directory "#{node[:home]}/repos/github.com/"

dotfile '.gitconfig'
dotfile '.gitignore'

dotfile '.git_template/hooks/post-checkout'