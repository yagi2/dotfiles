package 'robotsandpencils/made/xcodes'

execute "link xcodes" do
    command "brew link xcodes"
end

# use mas to initial install Xcode 
mas '497799835' # Xcode