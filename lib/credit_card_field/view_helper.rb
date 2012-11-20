module CreditCardField
  module ViewHelper  

    def credit_card_type_field(method, options = {})
      html = %Q(<div class="control-group">
          <div class="controls">
            <ul class="credit-card-type clearfix">
              <li class="icon visa #{'active' if self.object.try(method) == 'visa'}">Visa</li>
              <li class="icon master #{'active' if self.object.try(method) == 'master'}">Mastercard</li>
              <li class="icon american_express #{'active' if self.object.try(method) == 'american_express'}">American Express</li>
              <li class="icon diners_club #{'active' if self.object.try(method) == 'diners_club'}">Diners Club</li>
              <li class="icon not_valid #{'active' unless self.object.try(method)}">Invalid Card</li>
              <li class="hint not_valid"><strong>Not a Valid Credit Card Number</strong></li>
            </ul>
          </div>
        </div>).html_safe
      html << hidden_field(method, rel: 'card-type-field')
    end
    
  end
end
