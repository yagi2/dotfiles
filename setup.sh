# install homebrew
eval "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# pull mitamae
curl -fsSLo /usr/local/bin/mitamae https://github.com/itamae-kitchen/mitamae/releases/latest/download/mitamae-x86_64-darwin
chmod +x /usr/local/bin/mitamae