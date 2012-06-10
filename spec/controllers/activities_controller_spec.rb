require 'spec_helper'

describe ActivitiesController do
  let(:user) { FactoryGirl.create :user }
  before { sign_in user }


  describe "create" do
    context 'when everything is fine' do
      before { @category = FactoryGirl.create :category }
      before { post :create, activity: {category_id: @category.id, date: '2012-06-09', descriptions: []}, format: :json }
      it { should respond_with :unprocessable_entity }
      specify { ActiveSupport::JSON.decode(response.body)['errors'].count.should == 1 }
    end

    context 'iOS developers said that they have such situation' do
      before { @category = FactoryGirl.create :category }
      before { post :create, activity: {category_id: @category.id, date: '2012-06-09'}, format: :json }
      it { should respond_with :unprocessable_entity }
      specify { ActiveSupport::JSON.decode(response.body)['errors'].count.should == 1 }
    end
  end
end
