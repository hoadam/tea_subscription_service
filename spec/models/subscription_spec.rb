require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'associations' do
    it { should belong_to(:customer) }
    it { should belong_to(:tea) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price) }
    it { should validate_presence_of(:frequency) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:tea_id) }
    it { should validate_presence_of(:customer_id) }
  end

  describe 'enums' do
    it { should define_enum_for(:frequency).with_values([:once_per_week, :once_per_month, :twice_per_month]) }
    it { should define_enum_for(:status).with_values([:active, :canceled]) }
  end
end
