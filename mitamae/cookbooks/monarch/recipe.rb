execute "donwload monarch" do
    command "curl -o #{node[:home]}/bin/monarch_macos.zip --create-dirs https://d2dpq905ksf9xw.cloudfront.net/macos/monarch_macos_1.6.0.zip"
end

execute "unzip monarch archive file" do
    command "unzip #{node[:home]}/bin/monarch_macos.zip -d #{node[:home]}/bin"
end

execute "rename monarch directory" do
    command "mv #{node[:home]}/bin/monarch #{node[:home]}/bin/monarch_dir"
end

execute "move binary to bin directory" do
    command "mv #{node[:home]}/bin/monarch_dir/bin/monarch #{node[:home]}/bin/monarch"
end

execute "remove unneeded files" do
    command "rm -rf #{node[:home]}/bin/monarch_dir; rm -f #{node[:home]}/bin/monarch_macos.zip"
end 