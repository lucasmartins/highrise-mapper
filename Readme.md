[![Code Climate](https://codeclimate.com/github/lucasmartins/highrise-mapper.png)](https://codeclimate.com/github/lucasmartins/highrise-mapper) [![Build Status](https://secure.travis-ci.org/lucasmartins/highrise-mapper.png?branch=master)](https://travis-ci.org/lucasmartins/highrise-mapper) [![Dependency Status](https://gemnasium.com/lucasmartins/highrise-mapper.png)](https://gemnasium.com/lucasmartins/highrise-mapper)

Highrise Mapper
===============

This is a **WORK IN PROGRESS**

This Gem depends heavily on the [Highrise](https://github.com/tapajos/highrise) Gem, and although you are encouraged to use it with Rails, I made it to be framework independent.

This Gem adds [Highrise](https://github.com/tapajos/highrise) behavior to your models so you can call `@person.save_to_highrise`

Install
=======

You can:

`$ gem install highrise-mapper`

Or just add it to your Gemfile

`gem 'highrise-mapper'`

Use
===

### Configuration file
If you are on Rails, run the following command to generate a config file:

`$ rails g highrisemapper:config`

This file maps between the fields Highrise expects and the fields/methods your model has, like this.

```
#highrise_key: Model key 
person:
  first_name: name
  last_name: last_name
  company_name: company_name
  email_address: email
```

In this example, you could have a Person class like this one:

```
class Person
  def name
    'Albert'
  end

  def last_name
    'Einstein'
  end

  def company_name
    self.company.name
  end

  def email
    'albert.einstein@princeton.edu'
  end
end
```
Notice that this implementation is database agnostic, there is no database reference whatsoever.

Check the specs to see the testing example.

Contribute
==========

Just fork [HighriseMapper](https://github.com/lucasmartins/highrise-mapper), add your tool, and make a pull request.

Support
=======

This is an opensource project so don't expect premium support, but don't be shy, post any troubles you're having in the [Issues](https://github.com/lucasmartins/highrise-mapper/issues) page and we'll do what we can to help.

License
=======

Tacape Tools is free software under the [MIT license](http://lucasmartins.mit-license.org).