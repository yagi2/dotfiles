define :mas do
    name = params[:name]
    execute "mas install #{name}"
  end