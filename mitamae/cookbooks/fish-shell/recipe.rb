brew 'fish'

dotfile '.config/fish/config.fish'

execute "install oh-my-fish" do
    command <<~SCRIPT
    curl -L https://get.oh-my.fish > install
    fish install --path=#{node[:home]}/.local/share/omf --config=#{node[:home]}/.config/omf --noninteractive
    rm install
    SCRIPT
    not_if {File.exists?("#{node[:home]}/.local/share/omf")}
end

execute "install and apply bobthefish theme" do
    command "echo \"omf install bobthefish\" | fish"
    command "echo \"omf theme bobthefish\" | fish"
end