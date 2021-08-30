include_recipe File.expand_path('../../../helper.rb', __FILE__)

node.reverse_merge!(
  dotfiles: File.expand_path('../../../../config/', __FILE__),
  home: '/Users/yagi2'
)

include_cookbook 'dotfile'
include_cookbook 'cask'

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

cask '1password'
cask 'cmd-eikana'
cask 'fork'
cask 'visual-studio-code'
cask 'alfred'
cask 'editaro'
cask 'font-hack-nerd-font'
cask 'google-japanese-ime'
cask 'jetbrains-toolbox'
cask 'spotify'