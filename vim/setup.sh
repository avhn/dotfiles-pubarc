file="unknown"
if [[ "$OSTYPE" == "darwin"* ]] || [[ "$OSTYPE" == "linux-gnu" ]]; then
    file="$HOME/.vim"
elif [[ "$OSTYPE" == "msys"* ]]; then
    file="$HOME/vimfiles"
elif [[ "$file" == "unknown" ]]; then
	echo "OS not detected. Aborting!"
	exit
fi
mkdir $file

cd $(dirname $0)
echo -ne " - Linking .vimrc\n"
ln -sfn $(pwd)/.vimrc $HOME/.vimrc

echo -ne " - Cloning and linking themes\n"
git submodule update --init colorschemes
ln -sfn $(pwd)/colorschemes/colors $file/colors

echo " - Success!"
