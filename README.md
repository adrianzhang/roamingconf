# roamingconf
The script used to sync configurations of zsh, oh-my-zsh, and Sublime Text 2 &amp; 3 between different Linux and Mac.

# Usage
- Clone the repo to your local host which those software installed and configured already. (The host can be a Linux box or Mac)
- delete the `.git` folder in your cloned directory.
- copy your `~/.zsh` to the cloned directory
- copy your `~/.oh-my-zsh` to the cloned directory and rename as **`oh-my-zsh`** (without dot)
- copy `Packages/Users` in your Sublime Text config folder (not limited with Linux or Mac version, not limited 2 or 3 version) to cloned directory. Usually the Sublime Text config folder should be `~/.config/sublime-text-2` for a Sublime Text 2 installation on Linux. Theme and Color Scheme of ST should be moved to User folder and make changes to ST config before copy.
- commit this cloned directory into your new repo. Of cause you have to run `git init` first.
- run start.sh
- done. The configurations of your zsh, oh-my-zsh and Sublime Text are stored in your new repo. On other Linux or Mac, you can simply clone this repo to any folder and run `start.sh` to sync your configurations.
- don't forget to git commit after you change configurations on any synced host. And then apply new config with simply `git pull` run `start.sh` on other hosts.

# Notice
- before running `start.sh`, one of those software should be installed
- It is not necessary to install all of those software. Script `start.sh` can work without one or two, but at least you should install one, otherwise this script is useless to you.

# roammingconf 漫游配置
这里的脚本用来在不同的Linux和Mac OS之间同步你的zsh, oh-my-zsh, 以及Sublime Text 2和3 版本的配置文件。适用于你有多个操作系统的情况。

# 用法
- 将这个repo克隆到一个已经安装了上述软件的系统里任意路径下
- 删除本地克隆文件夹里的`.git`文件夹
- 将`~/.zsh`拷贝到本地克隆文件夹
- 将`~/.oh-my-zsh`拷贝到本地克隆文件夹并重命名为**`oh-my-zsh`** (去掉那个点)
- 在Sublime Text 2或者3的路径中找到`Packages/Users`这个文件夹并将User文件夹拷贝到克隆文件夹里（不限Linux或Mac，版本2或者3）。在拷贝前，Sublime的Theme和Color Scheme应当被移动到User文件夹中并对用户配置做出相应的修改。
- 将这个克隆文件夹提交到你的新repo中，当然首先得运行`git init`。
- 运行start.sh
- 在配置端的事情就结束了。这些配置文件都已经存到了你自己的新repo里。在别的任意Linux或Mac上，克隆你的新repo，并且运行`start.sh`一次，配置文件就同步完成了。
- 别忘记在做了配置变更后要提交变化到你的新repo。在别的机器上再次同步只需要运行git pull和start.sh。

# 注意
- 在运行start.sh之前，4个软件之一要已经安装了。
- 不必在每个机器上都安装全部软件，`start.sh`脚本可以只同步其中一两个配置，哪怕源机器上有4个软件而目标机器上只安装了1个，那么将只会把这一个软件的配置同步过去。
