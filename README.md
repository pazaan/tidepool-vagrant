Tidepool-vagrant
================

A Vagrant configuration to create a VM and check out all of the Tidepool repositories to get you developing on [Tidepool](http://tidepool.org) as quickly as possible.

Prerequisites
-------------
To use this `Vagrantfile`, you need to have [Vagrant](https://www.vagrantup.com/) installed, as well as one of the following VM providers:
* [VirtualBox](https://www.virtualbox.org/) (Windows, Mac OS X and Linux)
* [Parallels](http://www.parallels.com/) (Mac OS X only)
* [VMware Fusion](https://www.vmware.com/products/fusion) (Mac OS X) or [VMware Workstation](http://www.vmware.com/products/workstation) (Windows, Linux) with the [Vagrant VMware Provider](https://www.vagrantup.com/vmware) (Windows, Mac OS X, Linux)

To get started
--------------
* Create a top level tidepool directory somewhere (eg `tidepool`)
* Clone this repo into a subdirectory (eg `tidepool-vagrant`)
* Open a console, and change into the cloned directory
* Run `vagrant up --provider <Provider Name>`, where `<Provider Name>` is one of:
	* `virtualbox`
	* `parallels`
	* `vmware_desktop`

This will download and install the Base Ubuntu 14.04 virtual machine and install the following Tidepool dependencies:
* Node.js v12
* Gulp
* Mocha
* MongoDB 2.6.5
* golang 1.4.2
* bzr

Once the box has been set up, you can ssh into it using:
```
# vagrant ssh
```

This box also has some convenience aliases to help with development:
```
# tidepool-runservers # <-- Starts the tidepool servers
# tidepool-update     # <-- Fetches the latest changes and updates npm/bower
```