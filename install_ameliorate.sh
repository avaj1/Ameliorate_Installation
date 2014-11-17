: 'Shell Script to automate of Installation of packages depending on the baseline package-manager avaliable. Working internet connection for installation packages is a must.'

#!/bin/bash

red='\e[0;31m'
blue='\e[0;34m'
nc='\e[0m'
highlight='\e[1m'

yum_packages=( httpd openssh-server clementine nano )
apt_packages=( apache2 openssh-server clementine nano )

create_packlist()
{
	which yum &> /dev/null
	n1=`echo $?`
		if [ $n1 -eq 0 ]
		then
			pack_list[1]=yum
		fi

	which apt-get &> /dev/null
	n2=`echo $?`
		if [ $n2 -eq 0 ]
		then
			pack_list[2]=apt-get
		fi

	which rpm &> /dev/null
	n3=`echo $?`
		if [ $n3 -eq 0 ]
		then
			pack_list[3]=rpm
		fi

	which dpkg &> /dev/null
	n4=`echo $?`
		if [ $n4 -eq 0 ]
		then
			pack_list[4]=dpkg
		fi

	: 'which urpmi &> /dev/null
	n5=`echo $?`
		if [ $n5 -eq 0 ]
		then
			pack_list[5]=urpmi
		fi

	which zypper &> /dev/null
	n6=`echo $?`
		if [ $n6 -eq 0 ]
		then
			pack_list[6]=zypper
		fi'

echo "Following Package Managers are available: "

for pm in ${pack_list[@]}
do
	if [ "$pm" != "" ]
	then
		printf "${highlight}$pm${nc}\n"
	fi
done
count=${#pack_list[@]}
echo "--------------------------------------------------------------------------------"

printf "Enter the Package Manager by which packages should be installed.\n${blue}Warning: Selecting the package manager other than the default one may obliterate the System. Script will not respnsible for any damage caused since.${nc}\n"
echo "--------------------------------------------------------------------------------"
read bans

sans=`echo $bans | tr '[:upper:]' '[:lower:]'`
}

inst_pack()
{
if [ $mode -eq 1 ]
then
	for a in ${pack_list[@]}
	do
		if [ "$sans" == "$a" ]
		then
			if [ "$sans" == "yum" ]
			then
				for i in ${yum_packages[@]}
				do
					echo "Installing $i"
					$sans -y install $i &> /dev/null

					check=`echo $?`
					if [ $check -ne 0 ]
					then
						printf "${red}Package $i could not be Installed. Add the repo and try again.${nc}\n"
					else
						printf "${blue}$i Installed Successfully.${nc}\n"
					fi
				done
				break
	
			elif [ "$sans" == "apt-get" ]
			then
				for i in ${apt_packages[@]}
				do
					echo "Installing $i"
					$sans -y install $i &>/dev/null

					check=`echo $?`
					if [ $check -ne 0 ]
					then
						printf "${red}Package $i could not be Installed. Add the repo and try again.${nc}\n"
					else
						printf "${blue}$i Installed Successfully.${nc}\n"
					fi
				done
				break

			: 'elif [ "$sans" == "urpmi" ]
			then
				for i in ${urpmi_packages[@]}
				do
					echo "Work under progress"
				done
				break

			elif [ "$sans" == "zypper" ]
			then
				for i in ${zypper_packages[@]}
				do
					echo "Work under progress"
				done
				break'
			
			else
				printf "${red}Package Manager entered cannot be used. Still working on it.${nc}\n"
			fi

		else
			if [ $count -eq 1 ]
			then
				printf "${red}Package Manager entered is not available.\nPlease select the one available from list.${nc}\n"
			else
				count=$[count - 1]
			fi
		fi
	done

elif [ $mode -eq 2 ]
then
	for a in ${pack_list[@]}
	do
		if [ "$sans" == "$a" ]
		then
			if [ "$sans" == "yum" ]
			then
				for i in ${cust_packages[@]}
				do
					echo "Installing $i"
					$sans -y install $i &> /dev/null

					check=`echo $?`
					if [ $check -ne 0 ]
					then
						printf "${red}Package $i could not be Installed. Confirm the package name or try again after adding proper repo.${nc}\n"
					else
						printf "${blue}$i Installed Successfully.${nc}\n"
					fi
				done
				break

			elif [ "$sans" == "apt-get" ]
			then
				for i in ${cust_packages[@]}
				do
					echo "Installing $i"
					$sans -y install $i &> /dev/null

					check=`echo $?`
					if [ $check -ne 0 ]
					then
						printf "${red}Package $i could not be Installed. Confirm the package name or try again after adding proper repo.${nc}\n"
					else
						printf "${blue}$i Installed Successfully.${nc}\n"
					fi
				done
				break

			else
				printf "${red}Package Manager entered cannot be used. Work under progress.${nc}\n"
			fi

		else
			if [ $count -eq 1 ]
			then
				printf "${red}Package Manager entered is not available.\nPlease select the one available from list.${nc}\n"
			else
				count=$[count - 1]
			fi
		fi
	done
fi

}

if [ `id -u` -eq 0 ]
then
	printf "Select Installation Mode: \n 1. Auto Installtion\n 2. Custom Installtion\n\n"
	read mode

	case $mode in
		1)
		create_packlist
		inst_pack ;;

		2)
		echo "Enter the packages for custom installation"
		read -a cust_packages

		echo "--------------------------------------------------------------------------------"
		printf "${blue}Packages to be Installed${nc}\n"
		echo "--------------------------------------------------------------------------------"

		for pm in ${cust_packages[@]}
		do
			if [ "$pm" != "" ]
			then
				printf "${highlight}$pm${nc}\n"
			fi
		done 

		create_packlist
		inst_pack
		;;

		*)
			printf "${red}Invalid Input. Please select from the list.${nc}\n" ;;
		esac

else
	printf "${red}You need to be root to run this Scirpt${nc}\n"
fi
