package 'fish'

dotfile '.config/fish/config.fish'

execute "install fisherman" do
    command "echo \"curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher\" | fish"
end

execute "install and apply bobthefish theme" do
    command "echo \"fisher install oh-my-fish/theme-bobthefish\" | fish"
end