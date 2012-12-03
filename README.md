flash-dance
===========

Flash messages that make you dance.
##Quick Start##
Get the gem:
```ruby
gem 'flash-dance', :git => 'https://github.com/MunkiPhD/flash-dance.git'
```
Run `bundle install`

Then generate partials:
```
rails generate flash_dance:build_partials
```
In your controller:
```ruby
flash_me(:success, "It works! MUWAHAHA! #{Time.now}")
flash_me_now(:info, "Request flash message here!")
```
In your view:
```ruby
<%= render_flash_messages %>
```
Then run your code - it should look pretty and make you want to dance with how easy that was!

##Getting the gem##
Since the gem isn't officially released yet, in your rails gemfile:
```ruby
gem 'flash-dance', :git => 'https://github.com/MunkiPhD/flash-dance.git'
```

then make sure to get the gem code by running:
`bundle install`

Once you have the code, you have to run the generator for the partials:
```
rails generate flash_dance:build_partials
```
This will create the `flash_dance` directory in the full path: `app/views/flash_dance`
By default, you will get the following files:
```
+app
  +assets
    +stylesheets
      flash_dance.alerts.bootstrap.css
    +javascripts
      flash_dance.alerts.bootstrap.js
  +view
    +flash_dance
      _error.html.erb
      _info.html.erb
      _success.html.erb
      _warning.html.erb
```
The stylesheet and javascript files are from [Twitter's Bootstrap](http://twitter.github.com/bootstrap/) and are the 
bare minimum for creating nice alert boxes. They are the full versions (non-minified) for your editing pleasure.

##Controller##
The gem is built on the premise that there are four different types of flash messages: ***success***, ***error***,
***info***, and ***warning***.

When you want to add something to the flash, simply do:
```ruby
flash_me(:key, message) # where key is success, error, info, warning, etc
```
Or, if you want the flash to be part of the current request, do:
```ruby
flash_me_now(:key, message)
```

* `flash_me()` behaves like `flash[]`
* `flash_me_now()` behaves like `flash.now[]`

You can also add multiple messages to the same key, so we could do:
```ruby
flash_me_now(:success, "Created a new castle Harrenhal!")
flash_me_now(:success, "Populated castle Harrenhal with minions!")
```
However, if you decide to access the flash directly using:
```ruby
flash.now[:success] = "some random success message"
```
It will **override** any messages in that hash key that exists - so beware. (Plan on working on this in the future so that it can work nicely)

###Note###
You can add messages to whatever hash key you want. You could do something such as:
```ruby
flash_me(:some_random_hash_key, "some random message")
```
But it will crash when it attempts to render the flash messages because the partial doesn't exist.
The reason that it doesn't fail gracefully: checking to see if a partial exists requires a hit on the disk, which can lead to performance issues. Therefore, just let it crash - you should be testing so it should be caught. 

For non-default flash keys, simply create a partial under `flash_dance/` with the name `_{key}.html.erb` or use the generator to create it.

##View##
Wherever you want to place your alert messages, in your view use:
```ruby
<%= render_flash_messages %>
```
This view helper has the `compact` argument (default: true) which can be set like so
```ruby
<%= render_flash_messages false %>
```
The compact option combines messages in the same key into an unordered list on the partial. If you set it to `false` it will create an alert message for each one.

You might wonder why there are different partials for each flash hash key - it's for customization purposes. For example, you might want to allow the user to take different actions for each type of message, or simply customize the html. It's up to you - as long as a partial exists.
##Generator Options##
####build_partials####
You can view all the options by typing `rails generate flash_dance:build_partials --help`
The options are: 
* **`-bootstrap`** This determines whether to copy Twitter's Bootstrap files (css, js) for making the flash messages pretty.
If you're already using bootstrap, you can skip this option
* **`-close_buttons`** When generating the partials, you can choose whether to create them with the close button or not.
If you're using bootstrap, you probably want to keep these buttons

####build_partial####
TODO: write a generator for creating one off partials

##Additional Info##
Components used from Twitter's bootstrap:
* Components
 - Alerts
 - Close icon
* jQuery plugins
 - Transition
 - Alert messages


####ToDo####
* create a one off partial generator for other flash keys
* default the :message hash to :success
