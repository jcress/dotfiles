#copied from youtube
#do sudo apt-get build-dep vim 

hg clone https://vim.googlecode.com/hg vim
cd vim/src
./configure --enable-pythoninterp --with-features=huge --prefix=$HOME/opt/vim
make && make install
mkdir -p $HOME/bin
cd $HOME/bin
ln -s $HOME/opt/vim/bin/vim
ln -s ~/.dotfiles/vim ~/.vim

which vim
vim --version
sudo apt-get install gtk2-engines-pixbuf


# Setup Pathogen to manage your plugins
mkdir -p ~/dotfiles/vim/autoload ~/dotfiles/vim/bundle
cd ~/dotfiles/vim/autoload
wget -O pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim

#Color scheme
mkdir -p ~/dotfiles/vim/colors && cd ~/dotfiles/vim/colors
wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400

cd ~/dotfiles/vim/bundle
# Settings for vim-powerline
git clone git://github.com/Lokaltog/vim-powerline.git
# Settings for ctrlp
git clone https://github.com/kien/ctrlp.vim.git
# Settings for jedi-vim
git clone git://github.com/davidhalter/jedi-vim.git

