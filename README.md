# Referential
![example workflow](https://github.com/dvisockas/referential/actions/workflows/main.yml/badge.svg)

Referential lets you convert your ruby methods into procs without sacrificing functionality. Instead of raising `ArgumentError`, it returns back a proc!

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

Just extend your class with the `Referential` module and use `ref` keyword:

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

This lets you use these methods as procs and use them in a functional manner (using ruby pipeline, mapping by method, etc).

Instead of writing:

```ruby
class Operations
  ...

  def square_and_add_two(x)
    add_two(square(x))
  end
```

You can use the pipeline operator with your methods:

```ruby
class Operations
  ...

  def square_and_add_two(x)
    (&add_two << square).call(x)
    # Or you can fo the other way:
    # x.then(&add_two << square)
  end
end

Operations.new.square_and_add_two(2)
# => 6
```

You can do this with class methods too using `cref` keyword:
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


You can do this for arguments with more than one argument too. If a method accepts two arguments, and you pass only one, you'll get a curried proc back!:
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
