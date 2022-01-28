# lugotts NixOS configuration

This repository contains my NixOS configuration files. Other than the `*.nix` files you will be able to use all of the files on other operating systems like BSD, macOS or any of the other Linux distributions.

## Getting started

### Installing NixOS with my configuration

#### x86_64 architecture

1. Follow the [installation Guide](INSTALL.md) until you have a working system.
2. Boot it without the installation medium.
### Building from the Nix files

Clone this repository to somewhere, for example: *your home directory*, like this

```bash
git clone https://github.com/lugott/GoNixSys.git
```
#### NixOS

Assuming you `cd`ed into the cloned git repository,

To execute `manage.sh` you might have to run
```bash
chmod +x manage.sh
```

My configuration is specifically made for Dell XPS 15 9500 so If you danother one you'll have to adjust some files.

What configuration will be built when you run
```bash
./manage.sh --apply-system
```
is determined by your hostname so change your hostname or the files depending or which should be built. To change your hostname you can change `networking.hostname` in `/etc/nixos/configuration.nix` to one of the hostnames in `flake.nix` (*peter* and *Cryogonull*) and then build it with
```bash
nixos-rebuild switch
```

**Note that to build a config whether it is the system config or the Home manager config all required files need to be staged or commited with `git`.**

#### Home Manager

```bash
./manage.sh --apply-users
```


### How to hide your secrets in this repository

If you want to fork this repository and configure it to your liking you may want to put secrets in some files. I've put mine in `.secrets`. This folder is useless to you since it is encrypted.

The next to sub headings describe 2 ways in which you can encrypt your `.secrets`. `git-crypt` is more convenient. But first, follow the next steps.

1. ```bash
   rm .secrets .git-crypt
   ```

2. Put your secrets in `.secrets`.

3. If there are nix files in `.secrets` you may want to import them in the other nix files.

### via `git-crypt`

```bash
git-crypt init
```

### via `age`

Before doing commits with `git` you should run
```bash
./manage.sh --lock
```
to encrypt the secrets with a password. Otherwise your secrets won't be secrets anymore so be careful, if your secrets are included in the commit. Put that password in a password manager like Bitwarden. You'll need it to unencrypt your secrets with
```bash
./manage.sh --unlock
```
as you might've guessed by now.

## Licenses

[View this repository's licenses](LICENSE.md)

<!-- ## Credits

Thanks [Wil Taylor](https://github.com/wiltaylor) for teaching me nix flakes and `git crypt` in [your awesome tutorial series](https://www.youtube.com/watch?v=QKoQ1gKJY5A&list=PL-saUBvIJzOkjAw_vOac75v-x6EzNzZq-)! -->
