# my_linux_config

- There's is one main branch for each distro customization called `distro_name_main`.
- From that main branch a child branch will be born, named with an indication of the characteristic. example: `distro_name_indicative`.

## This branch

- My personal configuration for Debian 12.

## Branches


## Folders

- setup:
    - Folder with all the files configuration 
- etc
    - Linux `etc` configuration
- .config
    - Linux **user** `.config` folder
- others
    - others files used into the configuration process
- sources
    - icons and wallpapers

## Files Of The Repo:

- file that that do all the setup automaticly			--> `setup.sh`
- file that install all the basic drivers 				--> `setup_drivers.sh`

- file that install all the basic Packages				--> `setup_packages.sh`
- file that install all visual services basics 			--> `setup_graphic.sh`
- file that install all the basic aplications   		--> `setup_apps.sh`
- file that install all the basic tools         		--> `setup_tools.sh`
- file that setup `.config/` configuration      		--> `setup_config.sh`
- file that setup my default customization         		--> `setup_appearance.sh`

- file that install the ESP IDF                 		--> `setup_espidf.sh`

- file that update repo from the system         		--> `repo_update.sh`

## Manually Tasks To Do

Manual task that I need to perform once the new distribution has been installed

- [ ] Add/Create a SSH Github Key into the computer
- [ ] Add the SSH Key to Github
- [ ] Uninstall all unnecessary apps ( if I'm not in a netinstall )

