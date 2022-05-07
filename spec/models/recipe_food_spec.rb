require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'recipe_food model' do
    @user = User.create(name: 'John', email: 'john@doe.com', password: 'password')
    subject { Food.new(user_id: @user, name: 'Apple', measurment_unit: 'grams', price: 10) }
    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'measurement unit should be present' do
      subject.measurment_unit = nil
      expect(subject).to_not be_valid
    end

    it 'price should be present' do
      subject.price = nil
      expect(subject).to_not be_valid
    end
  end
end
