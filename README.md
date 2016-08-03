#JetBrains products debianizer

###Original idea by Casper Langemeijer

<https://github.com/langemeijer/phpstorm-deb.git>

###Changed by Vladislav Gorevoy

<https://github.com/gorevoy-vladislav>

##Install all necessary dependencies

```sh
sudo apt-get install devscripts debhelper
```

##Building

1)   Download the `.tar.gz` file from JetBrains download page and place it in
the ide-named directory of this repo;

2)   Run terminal in the root of this repo;

3)   Create a new debian/changelog file using the provided update.sh script;

4)   Build the package (CLion for example).

```sh
cd ./clion
sh ./update.sh
debuild -us -uc -b
```

##Installing

Install the packages with the `dpkg` command from root of this repo:

```sh
cd ../
sudo dpkg -i ./*.deb...
```
