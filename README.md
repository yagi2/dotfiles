# dotfiles

## Usage
*note*  
You have to login to AppStore before run this script. (for install apps from AppStore in this script.)  
```shell
$ git clone https://github.com/yagi2/dotfiles.git
$ dotfiles/setup.sh
$ /usr/local/bin/mitamae local dotfiles/mitamae/roles/darwin/default.rb
```

If you want to use a different user name
```shell
$ echo "{\"home\": \"/Users/${user_name}\"}" >/tmp/node.json
$ /usr/local/bin/mitamae local --node-json /tmp/node.json dotfiles/mitamae/roles/darwin/default.rb
```