#!/bin/bash

install_files () {
	echo -e "${GREEN}Installation proces began...${NC}\n\n"

	if [[ $ch == 0 || $ch == 1 ]]
	then
		# ------------------------ CONFIGS -----------------------
		# .zshrc
		cp config-files/.zshrc ~/
		if [ $? == 0 ] 
		then
			echo -e "[+]${LBLUE} .zshrc succesfully copied${NC}"
		else
			echo -e "[-]${RED} something went wrong while copying .zshrc${NC}"
		fi
		
		# .bashrc
		cp config-files/.bashrc ~/
		if [ $? == 0 ] 
		then
			echo -e "[+]${LBLUE} .bashrc succesfully copied${NC}"
		else
			echo -e "[-]${RED} something went wrong while copying .bashrc${NC}"
		fi

  		# .gruvbox_modified
		cp other/gruvbox-modified-by-retr0.vim /usr/share/nvim/runtime/colors
		if [ $? == 0 ] 
		then
			echo -e "[+]${LBLUE} gruvbox-modified-by-retr0.vim succesfully copied${NC}"
		else
			echo -e "[-]${RED} something went wrong while copying gruvbox-modified-by-retr0.vim${NC}"
		fi

		# .gitconfig
		cp config-files/.gitconfig ~/
		if [ $? == 0 ] 
		then
			echo -e "[+]${LBLUE} .gitconfig succesfully copied${NC}"
		else
			echo -e "[-]${RED} something went wrong while copying .gitconfig${NC}"
		fi

		# init.vim && coc-settings.json
		if [[ ! -d "~/.config/nvim/" && "~/.config/nvim/" =~ ^\. ]]
		then
			echo -e "[-]${RED} No directory path \"~/.config/nvim\", which is essential for NEOVIM configuration\n
	Please, check if all necessary folders exist${NC}"
		else
			cp config-files/init.vim ~/.config/nvim/
			if [ $? == 0 ] 
			then
				echo -e "[+]${LBLUE} init.vim succesfully copied${NC}"
			else
				echo -e "[-]${RED} something went wrong while copying init.vim${NC}"
			fi
			cp config-files/coc-settings.json ~/.config/nvim/
			if [ $? == 0 ] 
			then
				echo -e "[+]${LBLUE} coc-settings.json succesfully copied${NC}"
			else
				echo -e "[-]${RED} something went wrong while copying coc-settings.json${NC}"
			fi
		fi

		# alacritty.yml 
		if [[ ! -d "~/.config/alacritty/" && "~/.config/alacritty/" =~ ^\. ]]
		then
			echo -e "[-]${RED} No directory path \"~/.config/alacritty/\", which is essential for NEOVIM configuration\n
			Please, check if all necessary folders exist${NC}"
		else
			cp config-files/alacritty.yml ~/.config/alacritty/
			if [ $? == 0 ] 
			then
				echo -e "[+]${LBLUE} alacritty.yml succesfully copied${NC}"
			else
				echo -e "[-]${RED} something went wrong while copying alacritty.yml${NC}"
			fi
		fi
	fi

	if [[ $ch == 0 || $ch == 2 ]] 
	then
		# ------------------------ SCRIPTS -----------------------
		# nes_o.sh
		echo -e "${GREEN}Sudo commands folowing:${NC}"
		sudo cp shell-scripts/nes_o.sh /bin/
		if [ $? == 0 ] 
		then
			echo -e "[+]${LBLUE} script nes_o.sh succesfully copied${NC}"
		else
			echo -e "[-]${RED} something went wrong while copying script nes_o.sh${NC}"
		fi

		# nvim_swp_clear.sh
		sudo cp shell-scripts/nvim_swp_clear.sh /bin/
		if [ $? == 0 ] 
		then
		echo -e "[+]${LBLUE} script nvim_swp_clear.sh succesfully copied${NC}"
		else
			echo -e "[-]${RED} something went wrong while copying script nvim_swp_clear.sh${NC}"
		fi
	fi
}


#-------------------------CONSTANTS---------------------
RED='\033[0;31m'		# red 
GREEN='\033[0;32m'		# green 
CYAN='\033[0;36m'		# cyan
LBLUE='\033[1;34m'		# light blue
NC='\033[0m'			# no color

# --------------------------CODE-------------------------
clear
figlet -c -t -k -p -w 100 Config Installation

echo -e "\n\n${LBLUE}These is an installation script${NC}\n
${GREEN}Here you will choose, which files do you want to install.
To install:
\t- all files in all directiories - enter 0
\t- only configuration files - enter 1
\t- only shell scripts - enter 2"

echo -e "${CYAN}\nIt's time to choose: ${NC}"
read ch

clear
case $ch in
	0) 
	install_files
	echo -e "\n${LBLUE}All files are installed.\n 
	\t${RED}!!!!!!!!!!!! YOU NEED TO SET CHMOD +X FOR ALL SCRIPTS !!!!!!!!!!!! ${NC}"
	;;

	1)
	install_files
	echo -e "\n${LBLUE}All config files are installed${NC}"
	;;

	2)
	install_files
	echo -e "\n${LBLUE}All scripts are installed${NC}\n
	\t${RED}!!!!!!!!!!!! YOU NEED TO SET CHMOD +X FOR ALL SCRIPTS !!!!!!!!!!!! ${NC}"
	;;

	?)
	echo -e "[-]${CYAN} Man, read the desciption again, to whom did I write it, bruh?"
	;;
esac
