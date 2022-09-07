package 'pyenv'

execute 'install python2' do
    command "pyenv install 2.7.18"
end

execute 'install python3' do
    command "pyenv install 3.10.6"
end

execute 'use python2 and python3' do
    command "pyenv global 2.7.18 3.10.6"
end