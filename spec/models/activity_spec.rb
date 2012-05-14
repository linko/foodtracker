require 'spec_helper'

describe Activity do
  it { should validate_presence_of :category_id }
  it { should validate_presence_of :user_id     }
  it { should validate_presence_of :description }

  describe "should allow only numerical values for weight category" do
    before { @category = FactoryGirl.create :weight_category }
    it 'should be valid' do
      @activity = Activity.new user_id: 1, category: @category, description: '123.45', date: Date.today
      @activity.should be_valid
    end

    it 'should return errors' do
      @activity = Activity.new user_id: 1, category: @category, description: "aaa", date: Date.today
      @activity.should_not be_valid
    end
  end
end
