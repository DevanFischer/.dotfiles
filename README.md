## Do This First!

Log in once, run Software Update, and ensure that the operating system is at the latest point release. After all of the updates have been applied, restart the computer.

Log in again and create an Admin user account for your use. If other people will be using the machine, create Standard accounts for them. Log out of the initial account, and log in to the Admin account that you have just created.

Always log in with this new Admin account. The benefit of leaving the initial account untouched is that it ensures that you always have a working account to login with.

> _Admin accounts have sudo privileges_: All Admin accounts on a Mac may use sudo to run command-line utilities with administrative (root) privileges.

You should also find an external hard drive. Begin using Time Machine as soon as possible, as it provides the most easy method for backing up your system.

## Configuring a User Account

### Configuring The Trackpad

To make the trackpad behave correctly, ensure that these settings are enabled:

- _System Preferences > Trackpad > Tap to click_
- _System Preferences > Accessibility > Mouse & Trackpad > Trackpad Options… > Enable dragging_

### Creating a Private Applications Folder

Once you have logged into your account, create a folder called _Applications_ within your home folder. Whenever you are prompted to drag a new applications into the global Applications folder, put it in this private Applications folder instead. Some applications have to be installed to global folders, but in most cases you can keep the system directories clean by storing third-party products in your private Applications folder.

### Securing the Safari Browser

Whether or not you regularly use Safari, you should open it once, and adjust the settings in case that you use it later.

First, choose _Safari > Preferences > General_ and deselect the option _Open “safe” files after downloading_.

Second, go to _Safari > Preferences > Search_. Decide which search engine that you want to use. Ensure that _Safari Suggestions_ is not enabled.

Then, check the plug-in settings. Go to _Safari > Preferences > Security > Plug-in Settings…_ and review the plug-ins and settings.

## Configuring Security

Apple provide quite secure operating systems, but unfortunately convenience has won out over security in a few places. These can easily be corrected by changing a few settings. If you are using a laptop then you should probably make all of these changes as soon as possible.

### Basic Settings

Select _System Preferences > Security & Privacy_, and set the following:

- Under _General_, set r*equire a password after sleep or screen saver begins to immediately*
- Click _Advanced…_ and select _Require an administrator password to access system-wide preferences_
- Under _Firewall_, click _Turn Firewall On_.
- Under _Privacy_, select _Analytics_ and ensure that the options are not enabled.

### Enable File Vault NOW

Current versions of macOS include File Vault 2, a full-disk encryption system that has little in common with the much more limited File Vault 1. You should enable File Vault _NOW_, because it is the only protection against anyone with physical access to your computer. All other security measures will be completely bypassed if someone with physical access simply restarts the computer with a bootable pen drive.

> File Vault really is secure, which means that you can permanently lose access to your data if you lose the passwords and the recovery key.

### Set a Firmware Password

Set a password to stop access to the [Recovery](https://support.apple.com/en-us/HT201314) mode. Otherwise, any malicious individual can change the firmware settings to boot from a disc or device of their choosing. If you did not enable File Vault, then the attacker will have complete access to all of the files on the system.

[Apple Knowledge Base article HT204455](https://support.apple.com/en-gb/HT204455) provides full details.

### Setting Up Time Machine Backups

Time Machine is simple to set up. Just take a suitably large external hard drive, plug it in to your Mac, and agree when prompted. The drive setup process will reformat the hard drive. The only settings that may need to change are the exclusions.

Choose _System Preferences > Time Machine_, and click _Options_. Add to the exclusions list any folders that contain ISO disk images, virtual machines, or database files (such as Entourage). If the external hard drive is short of space, exclude the _System_ folder.

## Setting Up for Development

The first step is to install a compiler. The easiest way to install one is with the _Xcode Command Line Tools_ package.

Once you have the compiler that is provided by Xcode, you can use [Homebrew](http://brew.sh/) to install everything else that you need.

### Getting Xcode

Apple now provide the Xcode suite as a free download from the App Store. To install Xcode Command Line Tools, install Xcode from the App Store, then open a Terminal window and enter the following command:

    xcode-select --install

### Setting Up Homebrew

[Homebrew](http://brew.sh/) provides a package management system for macOS, enabling you to quickly install and update the tools and libraries that you need. Follow the instructions on the site.

You should also amend your PATH, so that the versions of tools that are installed with Homebrew take precedence over others. To do this, edit the file _.zshrc_ in your home directory to include this line:

    export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

You need to close all terminal windows for this change to take effect.

To check that Homebrew is installed correctly, run this command in a terminal window:

    brew doctor

To update the index of available packages, run this command in a terminal window:

    brew update

Once you have set up Homebrew, use the brew install command to add command-line software to your Mac, and _brew cask install_ to add graphical software. For example, this command installs the Slack app:

    brew cask install slack

### Enabling Auto Completion of Commands

Many command-line tools provide automatic completion of commands. These include Git, curl and the AWS command-line tool. Homebrew installs the files for each command-line tool that provides completion, but it does not enable automatic completion in your shell.

To enable auto completion, edit the file _.zshrc_ in your home directory to include this line:

    autoload bashcompinit && bashcompinit

Close all of the Terminal windows. Every new Terminal window will support autocompletion.

To use auto completion, type the name of the command, and press the Tab key on your keyboard. You will see a list of possible completions. Press the Tab key to cycle through the completions, and press the Enter key to accept a completion.

### Installing the Git Version Control System

The Xcode Command Line Tools include a copy of [Git](http://www.git-scm.com/), which is now the standard for Open Source development, but this will be out of date.

To install a newer version of Git than Apple provide, use Homebrew. Enter this command in a terminal window:

    brew install git

If you do not use Homebrew, go to the Web site and follow the link for Other Download Options to obtain a macOS disk image. Open your downloaded copy of the disk image and run the enclosed installer in the usual way, then dismount the disk image.

Always set your details before you create or clone repositories on a new system. This requires two commands in a terminal window:

    git config --global user.name "Your Name"
    git config --global user.email "you@your-domain.com"

The global option means that the setting will apply to every repository that you work with in the current user account.

To enable colors in the output, which can be very helpful, enter this command:

    git config --global color.ui auto

### Text Editors

Installations of macOS include a command-line version of [vim](http://www.vim.org/) and TextEdit, a desktop text editor. TextEdit is designed for light-weight word processing, and has no support for programming. Add the code editors or IDEs that you would prefer to use.

If you do not have a preferred editor, consider using a version of [Visual Studio Code](https://code.visualstudio.com/). Read the next section for more details.

To work with a modern Vim editor, install [Neovim](https://neovim.io/).

### Visual Studio Code

Visual Studio Code is a powerful desktop editor for programming, with built-in support for version control and debugging. The large range of extensions for Visual Studio Code enable it to work with every popular programming language and framework. It is available free of charge.

The Microsoft releases of Visual Studio Code are proprietary software with telemetry enabled by default. To avoid these issues, use the packages that are provided by the VSCodium project instead.

### Neovim

If you would like a modern Vim editor with a good default configuration, set up Neovim.

### Setting The EDITOR Environment Variable

Whichever text editor you choose, remember to set the EDITOR environment variable in your ~/.zshrc file, so that this editor is automatically invoked by command-line tools like your version control system. For example, put this line in your profile to make Neovim (nvim) the favored text editor:

    export EDITOR="nvim"

### Setting Up A Directory Structure for Projects

To keep your projects tidy, I would recommend following these guidelines. They may seem slightly fussy, but they pay off when you have many projects, some of which are on different version control hosts.

First create a top-level directory with a short, generic name like code. By default Go uses a directory called go, but you can change that when you set up a Go installation.

In this directory, create an src sub-directory. For each repository host, create a subdirectory in src that matches your username. Check out projects in the directory. The final directory structure looks like this:

    code/
         src/
             gitlab.com/
                        my-gitlab-username/
                                           a-project/
             sr.ht/
                   my-sourcehut-username/
                                         a-project/

### Creating SSH Keys

You will frequently use SSH to access Git repositories or remote UNIX systems. macOS includes the standard OpenSSH suite of tools.

OpenSSH stores your SSH keys in a .ssh directory. To create this directory, run these commands in a terminal window:

    mkdir $HOME/.ssh
    chmod 0700 $HOME/.ssh

To create an SSH key, run the ssh-keygen command in a terminal window. For example:

    ssh-keygen -t rsa -b 4096 -C "Me MyName (MyDevice) <me@mydomain.com>"

Use 4096-bit RSA keys for all systems. The older DSA standard only supports 1024-bit keys, which are now too small to be considered secure.

## Programming Languages

### JavaScript Development: Node.js

Homebrew provides separate packages for each version of [Node.js](https://nodejs.org/). To ensure that you are using the version of Node.js that you expect, specify the version when you install it. For example, enter this command in a Terminal window to install the Node.js 16, the current LTS release:

    brew install node@16

Add the bin/ directory for this Node.js installation to your PATH:

    /usr/local/opt/node@16/bin

### Go Development

Use Homebrew to install [Go](https://golang.org/):

    brew install golang

This provides the standard command-line tools for Go.

The current version of Go includes support for dependency management with modules. Use modules for new projects. Some existing projects still use dep, or an older tool.

### Setting a GOPATH

Current versions of Go do not require a GOPATH environment variable, but you should set it to ensure that third-party tools and Terminal auto-completion work correctly.

Set a GOPATH environment variable in your ~/.zshrc file:

    export GOPATH="$HOME/go"

Then, add this to your PATH:

    $GOPATH/bin

Close the Terminal and open it again for the changes to take effect.

### Python Development: pipenv

Current versions of macOS include a copy of Python 3, but this will not be the latest version of Python. Use Homebrew to install the latest release of Python.

To maintain current and clean Python environments, use [pipenv](https://pipenv.pypa.io/). This builds on two features of Python: the [virtual environments](https://docs.python.org/3/tutorial/venv.html) and the [pip](https://pip.pypa.io/en/stable/) utility.

Enter this command to install Python 3 and pipenv using Homebrew:

    brew install python3 pipenv

Use pipenv to manage your Python projects. The pipenv tool itself will automatically work with the copy of Python 3 from Homebrew.

To use the Python 3 interpreter outside of projects that are managed by pipenv, specify python3 on the command-line and in your scripts, rather than python:

    python3 --version

If you need to run the pip utility, rather than setting up a development environment with pipenv, always use the command pip3:

    pip3 --version

The [Python Guide tutorial](http://docs.python-guide.org/en/latest/dev/virtualenvs/) shows you how to work with pipenv.

## Kubernetes: Minikube

[Minikube](https://kubernetes.io/docs/setup/minikube/) sets up and manages Kubernetes on a single system, so that you can develop and test without needing a set of servers.

To install Minikube with Homebrew, run these commands in a terminal window:

    brew install kubernetes-cli
    brew install minikube

By default, Minikube uses a virtual machine manager. If you choose to install VirtualBox, MiniKube will use it. If you do not need VirtualBox, install [hyperkit](https://github.com/moby/hyperkit), which provides a minimal virtual machine manager.

    brew install hyperkit

To install [Helm](https://helm.sh/) with Homebrew, run this command in a terminal window:

    brew install kubernetes-helm

To install [Skaffold](https://skaffold.dev/) with Homebrew, run this command in a terminal window:

    brew install skaffold

[This article explains Minikube in more detail](https://www.stuartellis.name/articles/minikube).

## SQL Databases

Consider using containers to run the databases that you need. If you prefer to install services directly on to your workstation, Homebrew provides packages for PostgreSQL, MariaDB and MySQL.

### Installing PostgreSQL

To install PostgreSQL using Homebrew, enter this command in a terminal window:

    brew install postgresql

This command installs the server, the command-line tools, and the client libraries that are needed to compile adapters for programming languages.

Homebrew also provides some commands for managing your PostgreSQL installation. For example, to start the server, follow the instructions that are displayed after the installation process is completed. If you upgrade your copy of PostgreSQL, you should use the postgresql-upgrade-database command that Homebrew gives you.

### Database Management Tools

To work with SQL databases, use [Beekeeper Studio](https://www.beekeeperstudio.io/). This graphical tool supports the popular Open Source databases, as well as Microsoft SQL Server and Amazon Redshift.

Install Beekeeper with Homebrew:

    brew install beekeeper-studio

## Other Useful Desktop Applications for Developers

## Online Resources

The macOS Privacy and Security Guide by Dr Doh provides extensive information about those topics.

This readme is a altered version of [Stuarteliis](https://www.stuartellis.name/articles/mac-setup/#do-this-first)
