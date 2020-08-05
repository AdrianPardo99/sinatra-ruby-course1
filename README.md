# Sinatra project and basic syntax about #

## Instalación Ruby Sinatra Gem ##
```bash
  gem install sinatra
```

# Set the bind access from other host and first application #
```ruby
  require "sinatra"
#For set the access host server
  #Form 1
  set :bind, '0.0.0.0'    #For access in any interface of network
  #Form 2
  set :bind, '127.0.0.1'  #Default access only en localhost
  #Form 3
  set :bind, '<ip>'       #Other IP especific

#Define the default index page from the application

#Hello world in the Sinatra server application
  get '/' do
    "<h1>Hello World from Sinatra app<h1>"
  end

#Basic structure
  get 'route/path' do
    "Return the html mark"
  end

```
# Hints and tools of the Gem #
Sinatra can create and use HTML templates, that we can use in the files embedded ruby \-\> .erb files.

The erb files contains the HTML markdown and many code of Ruby
