## 个人使用的arch+i3wm简单配置

### pacman相关配置

[archlinuxcn]
SigLevel = Never
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
Server = http://mirrors.163.com/archlinux/$repo/os/$arch

sudo pacman-mirrors -c China

pacman-key --init
pacman-key --populate   

### 更新系统
sudo pacman -Syyu

### intel核显显卡驱动和x服务
pacman -S xorg-xinit xorg-server xorg-apps xf86-video-intel mesa

### 安装网络组建
pacman -S dhcpcd  NetworkManager wpa_supplicant netctl network-manager-applet dialog 

###安装git及下载该仓库配置文件

### 安装中文字体
pacman -S wqy-bitmapfont wqy-microhei wqy-zenhei

### 安装中文输入法
pacman -S  fcitx-im fcitx-configtool fcitx-googlepinyin 

### 终端及终端模拟器
pacman -S zsh alacritty 

### i3下壁纸、rofi、nvim(dmenu代替品)
pacman -S feh variety rofi neovim 

### 魔改版compton，带有毛玻璃效果
git clone https://github.com/tryone144/compton
make && make install
(需要安装libconfig、asciidoc)

### 安装sudo、新增一个管理员用户
pacman -S zsh sudo
useradd -m -G wheel -s /bin/bash josh

### oh-my-zsh及插件(同时增加sudo插件)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
vim ~/.zshrc
