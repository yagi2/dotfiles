package 'tmux'

dotfile '.tmux.conf'

execute "install tpm" do
    command "git clone https://github.com/tmux-plugins/tpm #{node[:home]}/.tmux/plugins/tpm"
end

execute "announce install tmux plugin" do
    command "echo \"Press Ctrl-S, I to install tmux plugins.\""
end