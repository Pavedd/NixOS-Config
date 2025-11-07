# Multi system NixOS Dendritic Config ;3

## Highlights
 - Both niri and hyprland fully configured
 - Multi System ready
 - uses flake-parts + import tree to make the config file structure irrelevant
 - 
## Installation:
To install this config just go through the normal nixos setup then afterwards make a copy of your hardware-configuration.nix and then clone this into /etc/nixos instead of the default config, then just copy the astolfo host folder and rename it to your hostname change out the hardware config with yours and do the flake-parts boilerplate in it. Lastly you just have to change all the mentions of astolfo in the configuration.nix to your hostname and then do a sudo nixos-rebuild switch --flake .#{your hostname}.

I know this sounds like a lot if you never used nixos but it works well once set up, i will probably make a install script at some point though to make this a lot easier(also still way better than reinstalling arch).

## Images:
<img width="1920" height="1200" alt="2025-08-28-220305_hyprshot" src="https://github.com/user-attachments/assets/e350448a-1186-4075-ad0e-174bafd4839f" />
<img width="1920" height="1200" alt="2025-08-28-221059_hyprshot" src="https://github.com/user-attachments/assets/6cfb1ce9-871d-4979-88c2-baaf32a40e71" />
