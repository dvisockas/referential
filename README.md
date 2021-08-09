# Referential
![example workflow](https://github.com/dvisockas/referential/actions/workflows/main.yml/badge.svg)

With Referential, you can convert your ruby methods into curried procs for use in composition, or as arguments to other methods, while still being able to call them directly!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'referential'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install referential

## Usage

Just extend your class with the `Referential` module and use the `ref` keyword:

```ruby
class Operations
  extend Referential

  ref def add_two(x)
    x + 2
  end

  ref def square(x)
    x ** 2
  end
end
```

This lets you use these methods as procs in a functional manner (by composing them, passing them as an argument to `.map`, etc).

Instead of writing:

```ruby
class Operations
  ...

  def square_and_add_two(x)
    add_two(square(x))
  end
  
  def added_squares(list)
    list.map { |x| add_two(square(x)) }
  end
```

You can use the composition operator:

```ruby
class Operations
  ...

  def square_and_add_two(x)
    x.then(&square >> add_two)
    # Or the other way around:
    # (&add_two << square).call(x)
  end
  
  def added_squares(list)
    list.map(&square >> add_two)
  end
end

Operations.new.square_and_add_two(2)
# => 6

Operations.new.added_squares([1, 2, 3])
# => [3, 6, 11]
```

The original method behaviour is preserved - you can always call `square(x)` directly.

Class methods can also be turned into procs by using the `cref` keyword:
```ruby
module Foo
  extend Referential

  module_function
  cref def square(x)
    x ** 2
  end
end

[1, 2, 3].map(&Foo.square)
#=> [1, 4, 9]
```


Methods with several arguments, if turned into procs, can be called directly by passing the required number of arguments.
If called with fewer arguments than required, a curried proc is returned instead!:
```ruby
class Operations
  extend Referential

  cref def self.multiply_by(x, y)
    x * y
  end
end

[1, 2, 3].map(&Operations.multiply_by(10))
#=> 10, 20, 30
```

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rspec spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dvisockas/referential. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/referential/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Referential project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/referential/blob/master/CODE_OF_CONDUCT.md).
