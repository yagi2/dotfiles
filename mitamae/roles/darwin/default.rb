include_recipe File.expand_path('../../../helper.rb', __FILE__)

node.reverse_merge!(
  dotfiles: File.expand_path('../../../../config/', __FILE__),
  home: '/Users/yagi2'
)

include_cookbook 'macos-system'

include_cookbook 'dotfile'
include_cookbook 'cask'
include_cookbook 'mas'

include_cookbook 'git'
include_cookbook 'fish-shell'
include_cookbook 'hyper'
include_cookbook 'nerd-font'
include_cookbook 'ruby' 
include_cookbook 'java'

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

cask '1password'
cask '1password-cli'
cask 'cmd-eikana'
cask 'fork'
cask 'visual-studio-code'
cask 'alfred'
cask 'editaro'
cask 'font-hack-nerd-font'
cask 'google-japanese-ime'
cask 'jetbrains-toolbox'
cask 'spotify'
cask 'stats'
cask 'cinch'
cask 'slack'
cask 'discord'
cask 'inkdrop'
cask 'figma'
cask 'zoom'

mas '485812721' # TweetDeck
mas '539883307' # LINE
mas '640199958' # Apple Developer
mas '497799835' # Xcode
mas '405399194' # Kindle
mas '585829637' # Todoist
