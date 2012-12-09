require "credit_card_type_field/version"
require 'rails'

module CreditCardField
  class Engine < ::Rails::Engine
    initializer 'credit_card_type_field' do |app|
      ActiveSupport.on_load(:action_view) do
        require "credit_card_type_field/view_helper"
        class ActionView::Helpers::FormBuilder
          include CreditCardTypeField::ViewHelper
        end

        begin
          require 'simple_form'
          class SimpleForm::FormBuilder
            include CreditCardTypeField::ViewHelper
          end
        rescue LoadError
        end
      end
    end
  end
end