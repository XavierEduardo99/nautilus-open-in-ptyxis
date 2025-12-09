# OpenInPtyxis

<p>Simple script to open the <a href="https://gitlab.gnome.org/chergert/ptyxis">Ptyxis terminal</a> from Nautilus (GNOME Files) Menu</p>

## Dependency
`nautilus-python`( `python-nautilus` on Debian/Ubuntu based)
### Debian / Ubuntu
```
sudo apt install python3-nautilus
```
### Fedora
```
sudo dnf install nautilus-python
```

## Installation
Clone this repository and use the GNUmakefile install script.
```
git clone https://github.com/XavierEduardo99/nautilus-open-in-ptyxis
cd nautilus-open-in-ptyxis
sudo make install
sudo make restart-nautilus
```
