# BitToggle

An elementary feature toggle implementation

## Installation

Add this line to your application's Gemfile:

    gem 'bit_toggle'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bit_toggle

## Usage

To enable a feature for a single object:

```ruby
user = User.find(username)
BitToggle.enable(:my_new_feature, device)
```

To enable a bit toggle globally:

```ruby
BitToggle.enable_globally(:my_new_feature)
```

To verify if a feature is enabled:

```ruby
BitToggle.enabled?(:my_new_feature, user)
```

To implement this in your codebase:

```ruby
def perform
  if BitToggle.enabled?(:my_new_feature, user)
    do_the_new_feature
  else
    do_the_old_feature
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
