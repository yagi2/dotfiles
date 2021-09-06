execute 'set system apprerance to dark' do
    command <<~SCRIPT
    defaults delete .GlobalPreferences AppleInterfaceStyleSwitchesAutomatically > /dev/null 2>&1
    defaults write .GlobalPreferences AppleInterfaceStyle -string "Dark"
    SCRIPT
end

execute 'set system accent color to pink' do
    command 'defaults write .GlobalPreferences AppleAccentColor -int 6'
end

execute 'set system highlight color to pink' do
    command 'defaults write .GlobalPreferences AppleHighlightColor -string "1.000000 0.749020 0.823529 Pink"'
end

execute 'set sidebar icon size to small' do
    command 'defaults write .GlobalPreferences NSTableViewDefaultSizeMode -int 1'
end

execute 'set show scroll bars to always' do
    command 'defaults write .GlobalPreferences AppleShowScrollBars -string "Always"'
end

execute 'set click in the scroll bar to jum to the next page' do
    command 'defaults write .GlobalPreferences AppleScrollerPagingBehavior -bool false'
end

execute 'set close windows when quitting an app to false' do
    command 'defaults write .GlobalPreferences NSQuitAlwaysKeepsWindows -bool true'
end

execute 'set dock size to 10' do
    command 'defaults write com.apple.dock tilesize -int 30'
end

execute 'set automatically hide the dock' do
    command 'defaults write com.apple.dock autohide -bool true'
end

execute 'set do not automatically rearrange spaces base on most recent use' do
    command 'defaults write com.apple.dock mru-spaces -bool false'
end

execute 'disable Siri' do
    command 'defaults write com.apple.assistant.support.plist "Assistant Enabled" -bool false'
end

execute 'do not show Siri in menu bar' do
    command 'defaults write com.apple.Siri StatusMenuVisible -bool false'
end

execute 'set preferred language to japanese' do
    command 'defaults write .GlobalPreferences AppleLanguages -array en ja'
end

execute 'set system region to japan' do
    command <<~SCRIPT
    defaults write .GlobalPreferences AppleMetricUnits -int 1
    defaults write .GlobalPreferences AppleLocale -string "en-JP"
    defaults write .GlobalPreferences AppleMeasurementUnits -string "Centimeters"
    SCRIPT
end

execute 'set first day of week to monday' do
    command 'defaults write .GlobalPreferences AppleFirstWeekday -dict gregorian 2'
end

execute 'set calendar to japanese' do
    command <<~SCRIPT
    ALOCAL=$(defaults read .GlobalPreferences AppleLocale | awk -F '@' '{print $1}')
    defaults write .GlobalPreferences AppleLocale -string "${ALOCAL}@calendar=japanese"
    SCRIPT
end

execute 'set temperature unit to celsius' do
    command 'defaults write .GlobalPreferences AppleTemperatureUnit -string "Celsius"'
end

execute 'set profile picture' do
    command <<~SCRIPT
    UNM=$(whoami)
    sudo dscl . create /Users/"${UNM}" Picture "#{node[:dotfiles]}/profile.png"
    SCRIPT
end

execute 'show Wi-Fi status in menu bar' do 
    command <<~SCRIPT
    defaults write com.apple.controlcenter "NSStatusItem Visible WiFi" -bool true
    defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist WiFi -int 18
    SCRIPT
end

execute 'show Bluetooth status in menu bar' do
    command <<~SCRIPT
    defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true
    defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Bluetooth -int 18
    SCRIPT
end

execute 'show volume status in menu bar' do
    command <<~SCRIPT
    defaults write com.apple.controlcenter "NSStatusItem Visible Sound" -bool true
    defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Sound -int 18
    SCRIPT
end

execute 'show battery status in menu bar' do
    command <<~SCRIPT
    defaults write com.apple.controlcenter "NSStatusItem Visible Battery" -bool true
    defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Battery -int 18
    SCRIPT
end

execute 'show battery percentage in menu bar' do
    command 'defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist BatteryShowPercentage -bool true'
end

execute 'set date and time automatically' do
    command 'sudo systemsetup -setusingnetworktime on > /dev/null'
end

execute 'show time digital' do
    command 'defaults write com.apple.menuextra.clock IsAnalog -bool false'
end

execute 'show display the time with seconds' do
    command 'defaults write com.apple.menuextra.clock ShowSeconds -bool true'
end

execute 'flash the time separators' do
    command 'defaults write com.apple.menuextra.clock FlashDateSeparators -bool true'
end

execute 'use a 24-hour clock' do
    command 'defaults write com.apple.menuextra.clock Show24Hour -bool true'
end

execute 'show input menu in menu bar' do
    command 'defaults write com.apple.TextInputMenu visible -bool true'
end

execute 'secondary click when click or tap with two fingers' do
    command <<~SCRIPT
    defaults write .GlobalPreferences ContextMenuGesture -int 1
    defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
    defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0
    SCRIPT
end

execute 'set tap to click' do
    command <<~SCRIPT
    defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    SCRIPT
end

execute 'scroll directon to natural' do
    command 'defaults write .GlobalPreferences com.apple.swipescrolldirection -bool true'
end

execute 'show hard disks to finder' do
    command 'defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true'
end

execute 'show external disks to finder' do
    command 'defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true'
end

execute 'show CDs, DVDs, and iPods to finder' do
    command 'defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true'
end

execute 'show connected servers to finder' do
    command 'defaults write com.apple.finder ShowMountedServersOnDesktop -bool true'
end

execute 'show tab bar in finder' do
    command <<~SCRIPT
    defaults write com.apple.finder ShowSidebar -bool true
    defaults write com.apple.finder ShowPreviewPane -bool true
    SCRIPT
end

execute 'show path bar in finder' do
    command 'defaults write com.apple.finder ShowPathbar -bool true'
end

execute 'set screenshots format' do
    command 'defaults write com.apple.screencapture type -string "png"'
end

execute 'disable DS_SCORE in network and usb' do
    command <<~SCRIPT
    defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
    SCRIPT
end

execute 'show hidden files' do
    command 'defaults write com.apple.finder AppleShowAllFiles true'
end

execute 'show directory details' do
    command <<~SCRIPT
    defaults write com.apple.finder ShowPathbar -bool true
    defaults write com.apple.finder ShowStatusBar -bool true
    defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
    SCRIPT
end