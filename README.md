rspec_selenium_headless
=======================

Examples of rspec tests using Capybara, Selenium webdriver and Headless.



# Installation

You need to install Xvfb ro run tests headlessly.

Read this tutorial http://maxivak.com/running-selenium-tests-with-ruby-on-centos/.


# Run tests

```bash

rake spec SPEC=spec/features/ex1_spec.rb

```



# Setup 

## spec/spec_helper.rb


require libs

```ruby
require 'capybara/rspec' 
require 'headless'

```


Capybara:
```ruby

# Capybara
Capybara.default_driver = :selenium
Capybara.default_wait_time = 20
Capybara.app_host = 'http://stackoverflow.com'
Capybara.server_port = 3000
Capybara.run_server = false #Whether start server when testing

Capybara.default_selector = :css #:xpath #default selector , you can change to :css

#Capybara.ignore_hidden_elements = false #Ignore hidden elements when testing, make helpful when you hide or show elements using javascript
Capybara.javascript_driver = :selenium #default driver when you using @javascript tag



RSpec.configure do |config|
  ...
  
  # capybara
  config.include Capybara::DSL
  
end
  
```


## Headless


Run headless with Xvfb service with autoclose.

in test file:

```ruby
RSpec.describe "My test", :type => :request do

  describe "my tests" do
  
    # for Linux env
    unless Gem.win_platform?
      headless = Headless.new(display: 99, autopick: true, reuse: false, destroy_at_exit: true).start
    end
    
    it "my test1" do
      ...
    end
      
    # more tests
  end
  
end
  
```