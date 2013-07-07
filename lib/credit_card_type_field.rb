require "credit_card_type_field/version"
require 'rails'

module CreditCardField
  class Engine < ::Rails::Engine
    initializer 'credit_card_type_field' do |app|
      ActiveSupport.on_load(:action_view) do
        require "credit_card_type_field/view_helper"
        class ActionView::Helpers::FormBuilder
          include ActionView::Helpers::CaptureHelper
          include CreditCardTypeField::ViewHelper::FormHelper
        end
        ActionView::Base.send :include, CreditCardTypeField::ViewHelper::FormTagHelper

        begin
          require 'simple_form'
          class SimpleForm::FormBuilder
            include ActionView::Helpers::CaptureHelper
            include CreditCardTypeField::ViewHelper::FormHelper
          end
        rescue LoadError
        end
      end
    end
  end
end