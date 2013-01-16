require 'spec_helper'

describe 'FormBuilder' do
  include Capybara::DSL

  describe '#credit_card_type_field' do
    it 'default setting', :js => true do
      visit '/credit_cards/new'
      page.should_not have_css('#credit-card-form1 li.visa.active')
      page.should have_css('#credit-card-form1 li.not_valid.active')    
      fill_in 'card-no-1', with: '4017954048470653'
      page.should have_css('#credit-card-form1 li.visa.active')
      page.should_not have_css('#credit-card-form1 li.master.active')
      page.should_not have_css('#credit-card-form1 li.not_valid.active')

      fill_in 'card-no-2', with: '4017954048470653'
      page.should have_css('#credit-card-form2 li.visa.active')
      page.should_not have_css('#credit-card-form2 li.master.active')
      page.should_not have_css('#credit-card-form2 li.not_valid.active')
    end    
    
    it 'should hightlight not valid card', :js => true do
      visit '/credit_cards/new'
      fill_in 'card-no-1', with: '123456789'
      page.should have_css('#credit-card-form1 li.not_valid.active')
    end  
  end

  describe '#credit_card_type_field_tag' do
    it 'should render tag', :js => true do
      visit '/credit_cards/new'
      fill_in 'card-no-3', with: '4017954048470653'
      page.should have_css('#credit-card-form3 li.visa.active')
    end
  end
end
        
