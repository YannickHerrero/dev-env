# Notes:

to make telescope works properly in wsl, you need to install fd-find and make a symlink as follow:

```sh 
sudo apt install fd-find
sudo ln -s $(which fdfind) /usr/bin/fd
```
