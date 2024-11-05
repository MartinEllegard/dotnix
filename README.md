# dotnix

Dotfiles and system setup using nix
<https://github.com/Baitinq/nixos-config>

## Setup nix multiuser

```bash
# Install nix package manager
sh <(curl -L https://nixos.org/nix/install) --daemon

# Create nix config dir
mkdir -p ~/.config/nix
# Create nix.conf
touch ~/.config/nix/nix.conf
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

## Setup repo

```bash
mkdir -p .config/home-manager
git clone https://github.com/martinellegard/dotnix.git ~/.config/home-manager
```

## Switch to current setup

```bash
nix --switch --flake ~/.config/home-manager
```
