include_recipe File.expand_path('../../../helper.rb', __FILE__)

node.reverse_merge!(
  dotfiles: File.expand_path('../../../../config/', __FILE__),
  home: '/Users/yagi2',
  arch: `uname -m`.chomp
)

include_cookbook 'macos-system'

include_cookbook 'dotfile'

include_cookbook 'cask'
include_cookbook 'mas'
include_cookbook 'tap'

include_cookbook 'git'
include_cookbook 'fish-shell'
include_cookbook 'alacritty'
include_cookbook 'tmux'
include_cookbook 'nvm'
include_cookbook 'ruby'
include_cookbook 'cocoapods'
include_cookbook 'java'
include_cookbook 'starship'
include_cookbook 'python'
# include_cookbook 'xcode' // https://github.com/RobotsAndPencils/xcodes/issues/148 の問題で一旦GUI版をCaskで入れる入れる 対応されたら戻す
cask 'xcodes' # 上記の対応が終わったら戻す

tap 'homebrew/cask-fonts'
tap 'leoafarias/fvm'
tap 'johanhaleby/kubetail'

package 'watch'
package 'tree'
package 'ffmpeg'
package 'gh'
package 'ki'
package 'micro'
package 'peco'
package 'source-highlight'
package 'exa'
package 'bat'
package 'jq'
package 'awscli'
package 'mas'
package 'pidcat'
package 'go'
package 'ghq'
package 'hub'
package 'tig'
package 'ag'
package 'wget'
package 'nodenv'
package 'fvm'
package 'gnupg'
package 'pinentry-mac'
package 'google-cloud-sdk'
package 'tfenv'
package 'docker-compose'
package 'kubectx'
package 'kustomize'
package 'skaffold'
package 'kubeseal'
package 'kubetail'

cask '1password' 
cask '1password-cli'
cask 'cmd-eikana'
cask 'fork'
cask 'visual-studio-code'
cask 'raycast'
cask 'editaro'
cask 'font-hack-nerd-font'
cask 'atok'
cask 'android-studio'
cask 'eset-cyber-security-pro'
cask 'spotify'
cask 'slack'
cask 'discord'
cask 'inkdrop'
cask 'figma'
cask 'zoom'
cask 'tweeten'
cask 'google-chrome'
cask 'appcleaner'
cask 'mountain-duck'
cask 'adobe-creative-cloud'
cask 'jetbrains-toolbox'
cask 'rancher'
cask 'skitch'

mas '539883307' # LINE
mas '640199958' # Apple Developer
mas '405399194' # Kindle
mas '585829637' # Todoist
mas '1429033973' # RunCat
mas '975890633' # HotKey App
