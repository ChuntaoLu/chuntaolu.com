[chuntaolu.com](http://chuntaolu.com)
======

This website is a [Ruby on Rails](http://rubyonrails.org) application built for blogging and creating static pages.

#### Some features:

* Database-stored static pages, easy to manage without modifying source code
* Simple admin interface for managing resources.
* Markdown support with [redcarpet](https://github.com/vmg/redcarpet) for blog and static page contents
* Code syntax highlighting with [Pygments.rb](https://github.com/tmm1/pygments.rb)
* CSS customization and responsiveness based on [Twitter Bootstrap](http://http://getbootstrap.com/)
* [Font Awesome](http://http://fortawesome.github.io/Font-Awesome/) icon integration
* Light weight and secure authentication with [Sorcery](https://github.com/NoamB/sorcery)
* Meaningful URLs with [Friendly Id](https://github.com/norman/friendly_id)
* External comment system with [Disqus](http://disqus.com/)

#### To play around:
create a `application.yml` file under `/config` with email and password
```
EMAIL: 'some_email'
PASSWORD: 'some_password'
```
Then run
```
rake db:migrate
rake db:seed # create a user with given email and password
```

Visit http://localhost:3000/login and login to see admin interface

To add some samples, run
```
rake db:populate
```

***
Building such a web app is certainly fun, but sometimes things can go wrong and it
becomes frustrating. Overall, I enjoyed a lot working on this project. And I have much
appreciation for the excellent [tutorials](http://tutorials.jumpstartlab.com/) by the
awesome people at [JumpstartLab](http://jumpstartlab.com/team), the invaluble
[RailsCasts](http://railscasts.com/), and ultimately [stackoverflow](http://stackoverflow.com/).