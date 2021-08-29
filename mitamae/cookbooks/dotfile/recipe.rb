define :dotfile do
    name = params[:name]
  
    src = File.join(node[:dotfiles], name)
    dst = File.join(node[:home], name)

    directory File.dirname(dst)
  
    link dst do
      to src
    end
  end