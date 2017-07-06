# Calculator

## Usage

set permissions
`chmod +x bin/calculator.rb`

run with
`./bin/calculator.rb`

```
> 1

> 2

> +
3.0
```

You can run tests with `bundle install` and `bundle exec rspec spec`

## Architecture

The app is pretty simple, there is a CalculatorRepl class that handles user interaction with the command line.

The Calculator class handles parsing the input and doing the math.

bin/calculator.rb acts as a simple executable for the app.

## TODO
This could be packaged as a real gem to make installation a little easier for people.
The case statement for handling input could start to grow large and unwieldy if additional operators are added in the future.
