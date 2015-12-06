require 'rails_helper'

RSpec.describe StudentPayment do
  describe 'validations' do
    it { is_expected.to validate_presence_of :payment_deadline }
  end

  describe 'database columns' do
    it { should have_db_column :payment_deadline }
    it { should have_db_column :date_of_payment }
    it { should have_db_column :amount }
  end

  describe 'associations' do
    it { is_expected.to belong_to :student }
  end
end
