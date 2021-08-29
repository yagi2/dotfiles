define :brew do
    name = params[:name]
  
    execute "brew install #{name}" do
      not_if "brew list #{name}"
    end
  end