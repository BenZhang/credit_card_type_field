# CreditCardTypeField

Credit card type field auto detected by the credit card number.

## Installation
Only support Rails 3.1+ with jQuery

Add this line to your application's Gemfile:

    gem 'credit_card_type_field'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install credit_card_type_field

Add to assets pipeline

application.js

    $ //= require credit_card_type_field

application.css

    $ *= require credit_card_type_field

## Tutorial

Support form_for and simple_form_for. Examples:

```ruby
  <%= form_for @credit_card do |f| %>
    <%= f.text_field :credit_card_no %>
    <%= f.credit_card_type_field :card_type %>
  <% end %>
```

Specify the credit card number name and supported credit card types. Target is the field that you input the credit card number.

```ruby
  <%= form_for @credit_card do |f| %>
    <%= f.text_field :card_no %>
    <%= f.credit_card_type_field :card_type, accept_types: %w(visa master), data: {target: '#card_no'} %>
  <% end %>
```

Done! CreditCardTypeField gem will add javascript keyup event listening to the credit card number field. It is able to detect what kind of the input 
credit card is according to the credit card number. At present, only visa master american_express diners_club are supported. 

## TODO
  
  add DEMO

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

MIT
