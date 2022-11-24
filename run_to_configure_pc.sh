echo
echo "***********************************************************"
echo "*                                                         *"
echo "*                   INSTALLING PACKAGES                   *"
echo "*                                                         *"
echo "***********************************************************"
echo
# Variables
config_folder="/home/$USER/ConfigLinux/Configs"

echo "====================> Install software-properties-common"
echo
sudo apt install software-properties-common -y &&
echo
echo "====================> Adding repositories to install"
echo
read -rsp $"Press any key to Continue"
echo
sudo add-apt-repository universe -y &&
# Faster option to install packages
sudo add-apt-repository ppa:apt-fast/stable -y &&
# Specific for ElementaryOS until version 6
sudo add-apt-repository ppa:philip.scott/pantheon-tweaks -y &&
# Optimize linux laptop battery life
# sudo add-apt-repository ppa:linrunner/tlp -y &&
sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa -y &&
sudo add-apt-repository ppa:git-core/ppa -y
echo
echo "====================> Update and Dist Upgrade"
echo
read -rsp $"Press any key to Continue"
echo
sudo apt update && sudo apt dist-upgrade -y &&
# Package installation
echo
echo "====================> install apt-fast"
echo
read -rsp $"Press any key to Continue"
echo
sudo apt install apt-fast -y &&
echo
echo "====================> Install ubuntu-restricted-extras"
echo
read -rsp $"Press any key to Continue"
echo
sudo apt-fast install ubuntu-restricted-extras -y &&
echo
echo "====================> Install software-properties-gtk"
echo
read -rsp $"Press any key to Continue"
echo
sudo apt-fast install software-properties-gtk -y &&
echo
echo "====================> install CURL"
echo
read -rsp $"Press any key to Continue"
echo
sudo apt install curl -y &&
echo
# echo "====================> Install tlp tlp-rdw"
# echo
# read -rsp $"Press any key to Continue"
# echo
# sudo apt-fast install tlp tlp-rdw -y &&
# sudo tlp start &&
# echo
echo "====================> Install latest Git"
echo
read -rsp $"Press any key to Continue"
echo
sudo apt-fast install git -y
echo
echo "--------------------> Downloading .gitconfig file"
echo
cd ~
git clone git@gist.github.com:4fafb520ad03493ceac0a998e7c27f02.git git_config &&
rm -rf ~/.gitconfig &&
ln git_config/.gitconfig ~/ &&
echo
echo "====================> Install firefox-trunk"
echo
read -rsp $"Press any key to Continue"
echo
sudo apt-fast install firefox-trunk -y &&
echo
echo "====================> Install microsoft edge"
echo
read -rsp $"Press any key to Continue"
echo
sudo curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg &&
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ &&
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list' &&
sudo rm microsoft.gpg &&
sudo apt update &&
sudo apt install microsoft-edge-dev &&
echo
echo "====================> Install VSCode Insiders"
echo
read -rsp $"Press any key to Continue"
echo
wget https://update.code.visualstudio.com/latest/linux-deb-x64/insider &&
mv insider insider.deb &&
sudo apt-fast install ./insider.deb -y &&
rm insider.deb &&
echo
# echo "====================> Install DBeaver"
# echo
# read -rsp $"Press any key to Continue"
# echo
# wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb &&
# sudo apt-fast install ./dbeaver-ce_latest_amd64.deb -y &&
# rm dbeaver-ce_latest_amd64.deb &&
# echo
echo "====================> Install asdf"
echo
read -rp $"Press any key to Continue"
echo
cd ~
git clone https://github.com/asdf-vm/asdf.git ~/.asdf &&
sudo apt install libedit-dev &&
sudo apt remove libssl-dev &&
sudo apt update &&
sudo apt install libssl-dev -y &&
echo
echo "====================> Install OverGrive (Google Drive Client)"
echo
read -rsp $"Press any key to Continue"
echo
wget https://www.thefanclub.co.za/sites/default/files/public/overgrive/overgrive_3.3.10_all.deb &&
sudo apt-fast install ./overgrive_3.3.*_all.deb -y &&
rm overgrive_* &&
echo
echo "====================> Install Docker"
echo
echo '*** At the end of this installation, it will login with another user. Just type EXIT to keep running the script'
echo
read -rsp $"Press any key to Continue"
echo
sudo apt-fast update &&
sudo apt-fast install -y apt-transport-https ca-certificates curl gnupg2 &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
sudo apt-key fingerprint 0EBFCD88 &&
sudo apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" -y &&
sudo apt-fast update &&
sudo apt-fast -y install docker-ce &&
sudo usermod -aG docker ${USER}
su - ${USER}
id -nG
echo
echo "====================> Install elementary-tweaks (dark theme)"
echo
read -rsp $"Press any key to Continue"
echo
sudo apt install pantheon-tweaks -y &&
echo
# echo "====================> Install Ayatana (Wingpanel Indicator)"
# echo
# read -rsp $"Press any key to Continue"
# echo
# mkdir -p ~/.config/autostart &&
# cp /etc/xdg/autostart/indicator-application.desktop ~/.config/autostart/ &&
# sed -i 's/^OnlyShowIn.*/OnlyShowIn=Unity;GNOME;Pantheon;/' ~/.config/autostart/indicator-application.desktop &&
# wget http://ppa.launchpad.net/elementary-os/stable/ubuntu/pool/main/w/wingpanel-indicator-ayatana/wingpanel-indicator-ayatana_2.0.3+r27+pkg17~ubuntu0.4.1.1_amd64.deb &&
# sudo dpkg -i wingpanel-indicator-ayatana_2.0.3+r27+pkg17~ubuntu0.4.1.1_amd64.deb &&
# rm wingpanel-indicator-ayatana_2.0.3+r27+pkg17~ubuntu0.4.1.1_amd64.deb &&
# echo
echo "====================> Install tree to terminal"
echo
read -rsp $"Press any key to Continue"
echo
sudo apt-fast install tree &&
echo
echo "====================> Install system monitor "
echo
read -rsp $"Press any key to Continue"
echo
sudo apt-fast install gnome-system-monitor -y &&
echo
echo "====================> Install vim"
echo
read -rsp $"Press any key to Continue"
echo
sudo apt-fast install vim -y &&
echo
echo "====================> Install and configure ZSH"
echo
read -rsp $"Press any key to Continue"
echo
sudo apt-fast install zsh -y &&
sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
echo
echo "--------------------> Install Oh my zsh"
echo
echo '*** It will open zsh at end of oh my zsh installation. Type EXIT to keep running the script'
echo
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo
echo "--------------------> Install powerline 10K (zsh theme)"
echo
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo
echo "--------------------> Installing fonts"
echo
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P ~/.local/share/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P ~/.local/share/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P ~/.local/share/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P ~/.local/share/fonts
echo
echo "--------------------> Configure files for zsh"
echo
echo "*** It will ask for Gihub\'s username and password or token."
echo "The token is in LastPass."
echo
cd ~ &&
rm -f ~/.zshrc;
rm -f ~/.sh_aliases.
rm -f ~/.p10k.zsh;
rm -f ~/.bashrc;
rm -f ~/.vimrc;
ln -s $config_folder/.zshrc ~/.zshrc;
ln -s $config_folder/.sh_aliases ~/.sh_aliases;
ln -s $config_folder/.p10k.zsh ~/.p10k.zsh;
ln -s $config_folder/.bashrc ~/.bashrc;
ln -s $config_folder/.vimrc ~/.vimrc;

echo
echo "--------------------> Configure zsh plugins"
echo
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &&
echo
echo "--------------------> Configure Terminal Font and Cursor"
echo
gsettings set io.elementary.terminal.settings font 'MesloLGS NF Regular 10'
gsettings set io.elementary.terminal.settings cursor-shape 'I-Beam'
read -rsp $"Press any key to Continue"
echo
echo "====================> Install flatpak"
echo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &&
echo
echo "--------------------> Install flatpak apps"
echo
flatpak install -y com.axosoft.GitKraken com.github.PintaProject.Pinta com.skype.Client com.slack.Slack com.spotify.Client io.github.celluloid_player.Celluloid org.gnome.clocks com.discordapp.Discord
echo
echo "====================> Package install Finished"
echo
echo "====================> apt-fast fix broken"
echo
read -rsp $"Press any key to Continue"
echo
sudo apt-fast --fix-broken install -y &&
echo
echo "====================> Clean up System"
echo
# Clean up the system
sudo apt-fast clean &&
sudo apt-fast autoclean &&
sudo apt-fast autoremove -y &&
timeout 3
echo
read -rsp $"The system needs to reboot. Press any key to proceed..."
echo
exit
