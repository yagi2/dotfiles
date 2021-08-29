include_recipe File.expand_path('../../../helper.rb', __FILE__)

node.reverse_merge!(
  dotfiles: File.expand_path('../../../../config/', __FILE__),
  home: '/Users/yagi2'
)

include_cookbook 'dotfile'
include_cookbook 'brew'
include_cookbook 'cask'

include_cookbook 'fish-shell'
# include_cookbook 'hyper'