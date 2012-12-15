module CreditCardTypeField
  module ViewHelper

    def credit_card_type_field(method, options = {})
      options[:card_number_field_name] ||= 'credit_card_no'
      field_name = "#{@object_name}\\\\[#{options[:card_number_field_name]}\\\\]"
      options[:accept_types] ||= %w(visa master american_express diners_club)
      html = '<ul class="credit-card-type clearfix">'.html_safe
      options[:accept_types].each {|type| html << "<li class=\"icon #{type} #{'active' if self.object.try(method) == type}\">#{type.camelize}</li>".html_safe }
      html << %Q(<li class="icon not_valid #{'active' unless self.object.try(method)}">Invalid Card</li>
              <li class="hint not_valid"><strong>Not a Valid Credit Card Number</strong></li>
            </ul>).html_safe
      html << hidden_field(method, rel: 'credit-card-type')
      html << %Q(
        <script>
          $('input[rel=credit-card-type]').closest('form').find('input[name=#{field_name}]').keyup(CreditCardField.keyup);
        </script>
        ).html_safe
    end

    def credit_card_type_field_tag(object_name, method, options = {})
      
    end
    
  end
end
