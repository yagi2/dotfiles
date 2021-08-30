package 'rbenv'

execute 'install latest ruby' do
    command <<~SCRIPT
    rbenv install $(rbenv install -L | grep -v - | tail -1)
    rbenv global $(rbenv install -L | grep -v - | tail -1)
    SCRIPT
end