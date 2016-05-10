# B64

Is a little commandline application for note taking purposes that 
encodes a string into Base64 and saves to a file named after a time 
(ex: 2099-09-06_15-45-50) 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'B64'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install B64

## Usage
Type :
    
    B64 -w 'anything' 

To write to a file 

Type :
    
    B64 -r path/to/file

To decode the file 

Type :

    B64 -d path/to/file
    
To delete the file

Type :
    
    B64 -h

To display this message

    Options:
     -w, --write=<s>    write file
     -r, --read=<s>     read file
     -d, --delete=<s>   delete file
     -h, --help         Show this message
     
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rangeroob/B64.


    1. Fork it
    2. Create your feature branch (git checkout -b my-new-feature)
    3. Commit your changes (git commit -am 'Add some feature')
    4. Push to the branch (git push origin my-new-feature)
    5. Create new Pull Request



## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

