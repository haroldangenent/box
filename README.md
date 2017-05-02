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
