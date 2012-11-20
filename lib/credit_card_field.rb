require "credit_card_field/version"
require 'rails'

module CreditCardField
  class Engine < ::Rails::Engine
    initializer 'credit_card_field' do |app|
      ActiveSupport.on_load(:action_view) do
        require "credit_card_field/view_helper"
        class ActionView::Helpers::FormBuilder
          include CreditCardField::ViewHelper
        end

        begin
          require 'simple_form'
          class SimpleForm::FormBuilder
            include CreditCardField::ViewHelper
          end
        rescue LoadError
        end
      end
    end
  end
end
