# package 'openjdk@11'

if node[:arch] == "arm64"
    execute 'create symbolic-link' do
        command "ln -sfn /opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk"
        user 'root'
    end
else
    execute 'create symbolic-link' do
        command "ln -sfn /usr/local/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk"
        user 'root'
    end
end