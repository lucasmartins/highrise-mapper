[![Gem version](https://badge.fury.io/rb/highrise-mapper.png)](http://rubygems.org/gems/highrise_mapper) [![Code Climate](https://codeclimate.com/github/lucasmartins/highrise-mapper.png)](https://codeclimate.com/github/lucasmartins/highrise-mapper) [![Build Status](https://secure.travis-ci.org/lucasmartins/highrise-mapper.png?branch=master)](https://travis-ci.org/lucasmartins/highrise-mapper) [![Dependency Status](https://gemnasium.com/lucasmartins/highrise-mapper.png)](https://gemnasium.com/lucasmartins/highrise-mapper)

Highrise Mapper
===============

This is a **WORK IN PROGRESS**

This Gem depends heavily on the [Highrise](https://github.com/tapajos/highrise) Gem, and although you are encouraged to use it with Rails, I made it to be framework independent.

This Gem adds [Highrise](https://github.com/tapajos/highrise) behavior to your models so you can call `@person.save_to_highrise`

Install
=======

You can:
```
  $ gem install highrise-mapper
```

Or just add it to your Gemfile
```
  gem 'highrise-mapper'
```

Use
===

### Configuration file
If you are on Rails, run the following command to generate a config file:

`$ rails g highrise_mapper:config`

This file maps between the fields Highrise expects and the fields/methods your model has, like this.

```yml
#highrise_key: Model key 
person:
  first_name: name
  last_name: last_name
  company_name: company_name
  email_address: email
```
Non-Railers should call `HighriseMapper.config(root_directory)` on application bootstrap, where it will be mapped like this: 
```ruby
  "#{root_dir}/config/highrise_mapper.yml"
```

### Your model

In this example, you could have a Person class like this one:

```ruby
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
### HighriseMapper::Person

When including, the module `HighriseMapper::Person` will check for expected behavior from your class, so you will have to make some changes:

```ruby
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

  def highrise_context
    #must return an instance that includes HighriseMapper::Context
    self.highrise_account
  end

  def highrise_id
    #must return the id this object has in Highrise
    112233
  end

  #must be included after required behavior has been added to the Class
  include HighriseMapper::Person
end
```

Check the [specs](https://github.com/lucasmartins/highrise-mapper/tree/master/spec) to see the testing example, it will surely make it clearer.

Notice that this implementation is database agnostic, there is no database reference whatsoever.

Checkout the [sample rails application](https://github.com/lucasmartins/highrise-mapper-example).

### HighriseMapper::Context

When saving to Highrise, `HighriseMapper::Person` will look for the **base url** and **token** to connect to the right account, so you must have a model that represents this account configuration:

```ruby
class SaasCustomer
  def name
    'Rails na Praia'
  end

  def highrise_base_url
    'https://railsnapraia.highrisehq.com'
  end

  def highrise_token
    'a11386d68bdd94fe549b8498afafce56'
  end
  #must be included after required behavior has been added to the Class
  include HighriseMapper::Context
end
```

It is designed this way so your SaaS application (example) can connect to multiple Highrise accounts, then we can have an ERP/CRM SaaS application where each customer sets up their own Highrise account.

Again, check the [specs](https://github.com/lucasmartins/highrise-mapper/tree/master/spec) to see the testing examples.

Contribute
==========

Just fork [HighriseMapper](https://github.com/lucasmartins/highrise-mapper), add your feature+spec, and make a pull request. Do not mess up with the version file though.

Also, if needed, update the code of the [sample application](https://github.com/lucasmartins/highrise-mapper-example).

Support
=======

This is an opensource project so don't expect premium support, but don't be shy, post any troubles you're having in the [Issues](https://github.com/lucasmartins/highrise-mapper/issues) page and we'll do what we can to help.

License
=======

Tacape Tools is free software under the [MIT license](http://lucasmartins.mit-license.org).