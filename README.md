# Versapay
A Ruby wrapper for the Versapay API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'versapay'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install versapay

### Credentials
Before the gem can be used, API credentials must be installed.
```ruby
# Install Versapay API credentials.
Versapay.versapay_host  = 'demo.versapay.com'
Versapay.versapay_token = '[API TOKEN]'
Versapay.versapay_key   = '[API KEY]'
```

For convenience, `load_env` can be used to install all credentials automatically from the environment.
```ruby
# Install credentials from ENV.
Versapay.load_env

# Which is equivalent to:
Versapay.versapay_host  = ENV.fetch('VERSAPAY_HOST')
Versapay.versapay_token = ENV.fetch('VERSAPAY_TOKEN')
Versapay.versapay_key   = ENV.fetch('VERSAPAY_KEY')
```

## Example Usage
The methods exposed by this gem mirror the methods in the [API Documentation](https://developers.versapay.com/#transactions-approve-a-transaction-post).
```ruby
# Fetch a Transaction from the VersaPay API.
transaction = Versapay::Transaction.retrieve('[TOKEN]')

# Fetch the VersaPay Balance Fund Source.
fund_source = Versapay::FundSource.list.detect { |fund_source| fund_source.type == 'balance' }

# Approve the Transaction, settings the Fund Source.
# NOTE: Can also be called with the respective tokens.
Versapay::Transaction.approve(transaction, fund_source)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Mihail-K/versapay.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
