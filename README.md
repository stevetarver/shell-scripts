This repo contains Bourne shell templates, scripts, snippets, and a playground that I use to experiment with new concepts. This is the boilerplate I start most production quality scripts from, and now you can to! Wrote a blog about it, wanna see it? Here you go:

* [Shell Scripts 1: Bourne back again](https://stevetarver.github.io/2018/06/12/shell-scripts-1-basics.html)
* Shell Scripts 2: Creating a great UX
* Shell Scripts 3: Program flow control
* Shell Scripts 4: Signals, Traps, and Docker scripts


## Resources

### Alpine Linux

* [Home](https://alpinelinux.org)
* [Wiki](https://wiki.alpinelinux.org/wiki/Main_Page)
* [Packages](https://pkgs.alpinelinux.org/packages)

### Bourne

Alpine Linux uses the Bourne shell packaged with [BusyBox](https://busybox.net/) - the [Almquist shell](https://en.wikipedia.org/wiki/Almquist_shell), aka 'A Shell', 'ash' or 'sh'. 

#### Standards & Man pages

* [IEEE Std 1003.1-2017 (POSIX.1-2017) sh](http://pubs.opengroup.org/onlinepubs/9699919799/utilities/sh.html)
* [IEEE Std 1003.1-2017 (POSIX.1-2017) utiilty arg syntax](http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap12.html)
* [IEEE Std 1003.1-2017 (POSIX.1-2017) getopts](http://pubs.opengroup.org/onlinepubs/009696799/utilities/getopts.html)
* [Alpine Linux ash (sh) man page](https://linux.die.net/man/1/ash)
* [Heirloom Bourne shell man page](http://heirloom.sourceforge.net/sh/sh.1.html)
* [FreeBSD Bourne shell man page](https://www.freebsd.org/cgi/man.cgi?query=sh&manpath=FreeBSD+7.1-RELEASE)

#### Tutorials

* [WikiBooks: Bourne Shell Scripting](https://en.wikibooks.org/wiki/Bourne_Shell_Scripting)
* [Bourne shell command language](http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_05_02)
* [bash-hackers getopts tutorial](http://wiki.bash-hackers.org/howto/getopts_tutorial)

#### Tips and tricks type articles

* https://codeburst.io/13-tips-tricks-for-writing-shell-scripts-with-awesome-ux-19a525ae05ae
* http://www.etalabs.net/sh_tricks.html

#### Character color control

* [Standard ECMA-48](https://www.ecma-international.org/publications/files/ECMA-ST/Ecma-048.pdf) - see SGR - SELECT GRAPHIC RENDITION.
* [Color codes in the shell](https://misc.flogisoft.com/bash/tip_colors_and_formatting)


## TODO

* Create an alpine derived docker image that includes docker and test the docker scripts
