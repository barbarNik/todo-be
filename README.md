# TODO-BE
## Installation

Test text

1. clone the repo
2. download and install [virtualbox](https://www.virtualbox.org/wiki/Downloads)
3. download and install [vagrant](https://www.vagrantup.com/downloads.html)
4. from projects root directory run `vagrant up`
5. **Important** make yourself a cup of coffee ;)
6. run `vagrant ssh`
    * if vagrant will require password - use `config.ssh.password` from `Vagrantfile`
    * This is due to the [bug](https://bugs.launchpad.net/cloud-images/+bug/1569237), so blame Ubuntu developers :)
7. project root is mapped to `/vagrant` inside the box
    * From this folder you can use `rails` commands as usually e.g. `rails s`
    * All resources are up and running and preconfigured


## Resources
* [this.vagrant.box](https://app.vagrantup.com/barbarnik/boxes/todo-be)
* App on [Heroku](https://floating-sea-99570.herokuapp.com/)
## Routes
```
   Prefix Verb   URI Pattern              Controller#Action
    items GET    /api/items(.:format)     items#index
          POST   /api/items(.:format)     items#create
     item GET    /api/items/:id(.:format) items#show
          PUT    /api/items/:id(.:format) items#update
          DELETE /api/items/:id(.:format) items#destroy
    login POST   /api/login(.:format)     authentication#authenticate
```
