# OARK-arduino-box
Vagrant setup for the Ardiuno development environment.

## Installing

Install Vagrant (check [https://www.vagrantup.com/](https://www.vagrantup.com/)) on how to do this.
Install Virtualbox (check with your Linux distribution on how to do this.)

Clone this repository, then cd into the directory.

Run 'vagrant up', the image should download and install necessary packages.

'vagrant ssh' to login.

## Structure

For now there will be a directory "projects" in the home directory of the vagrant default user. This folder is kept in sync with the projects directory. The intention being that the actual code for the Arduino bits will be checked out there.

It also means that files can be edited and commited using your local editor, and then the project could be made by 'make' on the guest VM.

There's a base-project directory, this is intended to be used as a template for any new code starting.

It does have provision for allowing unit testing of code, but involves symlinking code, this is because the Ardiuno main can't be compiled to work locally. We will see how we go.
