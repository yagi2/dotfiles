# dotfiles

## Usage
*note*  
You have to login to AppStore before run this script. (for install apps from AppStore in this script.)  

### Clone Git Repository
```shell
$ mkdir -p ~/repos/github.com/yagi2/dotfiles
$ git clone https://github.com/yagi2/dotfiles.git ~/repos/github.com/yagi2/dotfiles
```

### Setting SSH for GitHub
```shell
$ ssh-keygen -t ed25519 -C "yagi2.dev" # and save file path to ~/.ssh/id_ed25519_github
$ pbcopy < ~/.ssh/id_ed25519_github.pub # and add new SSH key in GitHub
$ ln -nfs ~/repos/github.com/yagi2/dotfiles/config/.ssh/config ~/.ssh/config
$ ssh -T git@github.com # test SSH connection
```

### Setup
```shell
$ dotfiles/setup.sh
$ /usr/local/bin/mitamae local dotfiles/mitamae/roles/darwin/default.rb
```

If you want to use a different user name
```shell
$ echo "{\"home\": \"/Users/${user_name}\"}" >/tmp/node.json
$ /usr/local/bin/mitamae local --node-json /tmp/node.json dotfiles/mitamae/roles/darwin/default.rb
```

### Install Xcode with xcodes after setup script
```shell
$ xcodes list # for login to Apple Developers
$ xcodes install --latest
```