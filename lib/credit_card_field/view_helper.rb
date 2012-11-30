module CreditCardField
  module ViewHelper

    def credit_card_type_field(method, options = {})
      options[:card_number_selector] ||= "##{@object_name}_credit_card_no"
      options[:accept_types] ||= %w(visa master american_express diners_club)
      html = '<ul class="credit-card-type clearfix">'.html_safe
      options[:accept_types].each {|type| html << "<li class=\"icon #{type} #{'active' if self.object.try(method) == type}\">#{type.camelize}</li>".html_safe }
      html << %Q(<li class="icon not_valid #{'active' unless self.object.try(method)}">Invalid Card</li>
              <li class="hint not_valid"><strong>Not a Valid Credit Card Number</strong></li>
            </ul>).html_safe
      html << hidden_field(method, rel: 'credit-card-type')
      html << %Q(
        <script>
          $('input[rel=credit-card-type]').closest('form').find('#{options[:card_number_selector]}').keyup(CreditCardField.keyup);
        </script>
        ).html_safe
    end
    
  end
end
