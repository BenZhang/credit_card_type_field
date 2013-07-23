module CreditCardTypeField
  module ViewHelper

    module FormHelper
      def credit_card_type_field(method, options = {})
        raise 'please specify data target' unless options.has_key?(:data)
        options[:accept_types] ||= %w(visa master american_express diners_club)
        html = '<ul class="credit-card-type clearfix">'.html_safe
        options[:accept_types].each {|type| html << "<li class=\"icon #{type} #{'active' if self.object.try(method) == type}\">#{type.camelize}</li>".html_safe }
        html << %Q(<li class="icon not_valid #{'active' unless self.object.try(method)}">Invalid Card</li>
                <li class="hint not_valid"><strong>Not a Valid Credit Card Number</strong></li>
              </ul>).html_safe
        html << hidden_field(method, rel: 'credit-card-type', data: options[:data])
        html
      end
    end

    module FormTagHelper
      def credit_card_type_field_tag(name, value = nil, options = {})
        raise 'please specify data target' unless options.has_key?(:data)
        options[:accept_types] ||= %w(visa master american_express diners_club)
        html = '<ul class="credit-card-type clearfix">'.html_safe
        options[:accept_types].each {|type| html << "<li class=\"icon #{type} #{'active' if value == type}\">#{type.camelize}</li>".html_safe }
        html << %Q(<li class="icon not_valid">Invalid Card</li>
                <li class="hint not_valid"><strong>Not a Valid Credit Card Number</strong></li>
              </ul>).html_safe
        html << hidden_field_tag(name, value, rel: 'credit-card-type', data: options[:data])
        html
      end
    end
    
  end
end
