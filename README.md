# dotfiles

## Usage
```shell
git clone https://github.com/lime1024/dotfiles.git
dotfiles/setup.sh
/usr/local/bin/mitamae local dotfiles/mitamae/roles/darwin/default.rb
```

If you want to use a different user name
```shell
echo "{\"home\": \"/Users/${user_name}\"}" >/tmp/node.json
/usr/local/bin/mitamae local --node-json /tmp/node.json dotfiles/mitamae/roles/darwin/default.rb
```