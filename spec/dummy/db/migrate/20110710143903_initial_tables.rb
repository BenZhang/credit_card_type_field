class InitialTables < ActiveRecord::Migration
  def self.up
    create_table :credit_cards do |t|
      t.string  :credit_card_no
      t.string  :card_type
      t.date    :expired_on
      t.string  :cardholder_name      
    end
  end

  def self.down
    drop_table :credit_cards    
  end
end
