require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Recipe model' do
    before(:each) do
      @user = User.create(name: 'tom', email: 'tom@tom.com', password: '123456')
    end

    it 'name must not be blank' do
      recipe = Recipe.create(name: '', cooking_time: '1', preparation_time: '1', description: 'description',
                             public: true, user_id: @user.id)
      expect(recipe).to be_valid
    end
  end
end
