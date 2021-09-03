package 'openjdk@8'

execute 'create symbolic-link' do
    command "ln -sfn $(brew --prefix)/opt/openjdk@8/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-8.jdk"
    user 'root'
end