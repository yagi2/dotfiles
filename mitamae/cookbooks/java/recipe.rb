package 'java'

execute 'create symbolic-link' do
    command "ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk"
    user 'root'
end