# External::open

`External::open` is a method to open something in manner or current OS.
This is inspired by [node-open](https://github.com/pwnall/node-open).



## Installation

Add this line to your application's `Projectfile`:

```crystal
deps do
  github "rhysd/open"
end
```



## Usage

```crystal
require "external"

External::open "http://crystal-lang.org/"
External::open "file:///Users/foo/Documents/somedoc.pdf"
External::open "../../README.md"
External::open "musics/bar.mp3"
```



## Contributing

1. Fork it ( https://github.com/rhysd/open/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [@rhysd](https://github.com/rhysd) - creator, maintainer
