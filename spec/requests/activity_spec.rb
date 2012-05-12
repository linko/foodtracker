require "spec_helper"

describe 'Activity' do
  let(:user) { Factory :user }
  before { sign_in_as_user(user) }

  describe 'activity list' do
    context 'when no records' do
      before { visit '/' }
      specify { page.should have_content 'No activities yet' }
    end

    context 'with record' do
      before { @activity = FactoryGirl.create :activity, description: "2 eggs", user: user }
      before { visit '/' }
      specify { page.should have_content '2 eggs' }
    end
  end

  describe 'add activity' do
    before { @category = FactoryGirl.create :category, name: 'Lunch' }
    before { @category_weight = FactoryGirl.create :weight_category }
    before { visit '/' }
    before { click_on 'ADD' }

    context 'when everything ok' do
      specify 'should display new activity in main feed' do
        select @category.name, from: "What"
        fill_in 'Description', with: 'coffee'
        click_button 'Create Activity'
        page.should have_content 'coffee'
      end
    end

    context 'with empty description' do
      before do
        select @category.name, from: "What"
        click_button 'Create Activity'
      end

      specify 'should display new activity in main feed' do
        page.should have_content "can't be blank"
      end
    end

    context 'add in weight category with text description' do

      before do
        select @category_weight.name, from: "What"
        fill_in 'Description', with: 'coffee'
        click_button 'Create Activity'
      end

      specify 'should display new activity in main feed' do
        page.should have_content "should be numerical"
      end
    end

    context 'add in weight category when description is a number' do
      before do
        select @category_weight.name, from: "What"
        fill_in 'Description', with: '9910'
        click_button 'Create Activity'
      end

      specify 'should display new activity in main feed' do
        page.should have_content "9910"
      end
    end


  end

  describe 'edit activity' do
    before { @activity = FactoryGirl.create :activity, description: "2 eggs", user: user }
    before { visit edit_activity_path(@activity) }
    specify do
      fill_in 'Description', with: "3 eggs"
      click_button 'Update Activity'
      page.should have_content '3 eggs'
    end
  end

  describe 'remove activity' do
    before { @activity = FactoryGirl.create :activity, description: "2 eggs", user: user }
    before { visit edit_activity_path(@activity) }
    specify do
      click_link 'Delete'
      page.should_not have_content '2 eggs'
    end

  end
end