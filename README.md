# Box 🎁
Opinionated Vagrant box, based on [Scotch Box](https://github.com/scotch-io/scotch-box).

## Features

- Automatically add used domains (vhosts) to `/etc/hosts`
- Database export on each `vagrant halt` or `vagrant destroy`
- Database import on first `vagrant up`
- PHP 7.1
- [Xdebug](https://xdebug.org/)
- [Webgrind](https://github.com/jokkedk/webgrind) (installed on `www.webgrind.localhost`)
- [Bundler](http://bundler.io/)
- [Composer](https://getcomposer.org/)
- [Subversion](https://subversion.apache.org/)
- [WP-CLI](http://wp-cli.org/)
- Enabled SSL module

## Installation

1. Clone this repo
2. Run `vagrant up` inside the cloned directory

### Prerequisites

- [Vagrant](https://www.vagrantup.com/)
- [vagrant-triggers](https://github.com/emyl/vagrant-triggers)

## Usage

### New project
To add a project, create a config file inside the `sites/` directory. An example config file for a project that uses the `web/` directory as webroot:

**example.conf**
```
<VirtualHost *:80>
    ServerName www.example.localhost
    DocumentRoot /var/www/example/web
</VirtualHost>
```

### Reload vhosts
You can run `vagrant provision --provision-with vhosts` to _only provision_ the available vhosts, without provisioning the entire box.

## Resources
Some useful resources for commonly needed features:

- [Mailtrap.io](https://mailtrap.io/) for mail testing
- [Generating SSL certificates](https://github.com/Varying-Vagrant-Vagrants/VVV/wiki/Site-specific-self-signed-SSL-certificates) for local SSL testing
