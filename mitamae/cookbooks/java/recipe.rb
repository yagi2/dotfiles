package 'openjdk@11'

execute 'create symbolic-link' do
    command "ln -sfn /usr/local/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk"
    user 'root'
end