![Travis status](https://travis-ci.org/mkrug/ruby.mk.png)

# ruby.mk

* https://github.com/mkrug/ruby.mk


## DESCRIPTION:

Ruby on Rails blog application deployed at: [http://ruby.mk](http://ruby.mk)


## INSTALL:

- Clone repository

```
git clone https://github.com/mkrug/ruby.mk
cd ruby.mk
```

Config database

```
cp config/database.yml.template config/database.yml
vi config/database.yml
```

Configure application

```
cp config/config.yml.template config/config.yml
```

Install gems

```
bundle install
```

Setup database

```
rake db:create
rake db:migrate
```

Seed admin user

```
vi db/seeds.rb
rake db:seed
```

Start the server

```
ruby script/server
```

Run specs

```
rspec spec
```


## DEPLOY

 Setup production

```
gitploy production setup
```

Deploy to production

```
gitploy production
```


## CONTRIBUTORS

See [contributors graph](https://github.com/mkrug/ruby.mk/graphs/contributors).



## LICENSE:

(The MIT License)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
