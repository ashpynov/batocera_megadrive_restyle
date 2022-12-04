# Batocera  Megadrive restyle 

Currently EmulationStation used in Batocera is aimed to be "Xbox" or "Switch" or "Playstation" gamepad 'oriented'. 

But if you fan of Genesis/Megadrive consoles - your main gamepad can be Sega-inspired 6-buttons 'ABC/xyz' controllers like amazing 8bitDO M30 or Retroflag.

Thus confuse seriously on helpbar how to navigate alongside EmulationStation.

# HOW TO INSTALL

- Clone repository:
  
  ```git clone```

- Copy content to Batocera via ssh 
- login to Batocera via ssh
- Execute ```./restyle.sh``` script to make changes temporary and issue ```batocera-es-swissknife --restart``` to apply it temporary
- Execute ```./install.sh``` script to build pacman package, install it and store permanently.

# Technical details

## EmulationStation patch

This do the magic with ```/usr/share/emulationstation```:

- Copy new button images into default es-carbon theme assets at: ```./resources/help/megadrive/``` directory
- Copy new subset ```megadrive.xml``` into ```./themes/es-theme-carbon/subsets/help/``` directory
- Apply ```1.theme.diff``` patch onto ```themes/es-theme-carbon/theme.xml``` to add new subset to theme.
- After this manipulation new item **"Megadrive buttons"** at ***"Menu -> User Interface Settings -> Theme Configuration -> Help Buttons"***  appears to select other help buttons.

## Libretro patch
Unfortunatelly not only Emulation station require update. Libretro also use some images assets to visualise buttons in menu (Batocera uses XMB menu provider). This assets are located at ```/usr/share/libretro/assets/xmb/monochrome/png``` and will be overwritten by package.

## Permananent and temporary changes
This images will be rewritten **forever** as soon as overlay will be updated after installation. At least till next batocera update. In case of ES patching - changes are minor and can be easily reverted (or ignored) but in case of libretro changes are done **permanently**.

There is ability to install this patch temporery - till reboot without updating overlay. But this will need to manipulate on boot script every boot time (TBD).

# TODO:
1. Patch libretro on ES change settings according to selected help settings
2. Incorporate /etc/init.d/ script manipulation to avoid permanent storage in overlay

