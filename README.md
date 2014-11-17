<h1>Ameliorate_Installation</h1>

Whenever installed a new system there are a lots of packages which users requires in order to work with system. User keeps on typing commands after commands to install each and every package. Hence the idea is to ease out attended task required during installation of each and every single package required.

Script will identify the baseline Package-Managers available according to the system configurations and will ask for package-manager by which packages should to installed. <b>Selecting the package manager other than the default or system depended may obliterate (wipe-out) the system. Script doesn't update repolist, hence packages avaiable from repolist will get installed.</b> Currently the script is only capable for use to <b>'apt-get'</b> and <b>'yum'</b> package-managers. Further advancements shall include other managers as well. Also may try to update repolist according to packages.

Script will run with two installation modes:

 1. Auto Installation
 2. Custom Installation

<b>Auto Installaiton</b>: Few packages already defined will only get installed.

Packages given by default are:

 * apache2 (httpd for yum)
 * openssh-server
 * nano
 * clementine

Other packages can be added according to the need. For this 2nd mode of installation would work.

<b>Custom Installation</b>: User needs to add packages required by him. when asked for user should enter package list in following format otherwise script will not work

`$ httpd openssh-server nano clementine`

<h4>Running the script</h4>
You need to have root privileges in order to run the script. No excutable permissions given, hence use bash inorder to run the script.

`$ sudo bash install_ameliorate.sh`
 
 or

`# bash install_ameliorate.sh`
