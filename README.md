Ameliorate_Installation

Whenever installed a new system there are a lots of packages which users requires in order to work with system. User keeps on typing commands after commands to install each and every package. Hence the idea is to ease out attended task required during installation of each and every single package required.

Script will identify the baseline Package-Managers available according to the system configurations and will ask for package-manager by which packages should to installed. Selecting the package manager other than the default or system depended may obliterate (wipe-out) the system. Script doesn't update repolist, hence packages avaiable from repolist will get installed. Currently the script is only capable for use to 'apt-get' and 'yum' package-managers. Further advancements shall include other managers as well. Also may try to update repolist according to packages.

Script will run with two installation modes:

    Auto Installation
    Custom Installation

Auto Installaiton: Few packages already defined will only get installed.

Packages given by default are:

    apache2 (httpd for yum)
    openssh-server
    nano
    clementine

Other packages can be added according to the need. For this 2nd mode of installation would work.

Custom Installation: User needs to add packages required by him. when asked for user should enter package list in following format otherwise script will not work

$ httpd openssh-server nano clementine
