require "spec_helper"

describe "Reports" do
  let(:user) { Factory :user }


  describe "#index" do
    before { sign_in_as_user(user) }
    context "no activities" do
      before { visit reports_path }
      specify { page.should have_content 'No activities'}
    end

    context "with activities" do
      before { @activity = FactoryGirl.create :activity, user: user }
      before { visit reports_path }
      specify { page.should have_content @activity.description }
    end

  end

  describe "create report" do
    before { sign_in_as_user(user) }
    before { @activity = FactoryGirl.create :activity, user: user }
    before { visit reports_path }
    specify do
      click_on 'Send email'
      page.should have_content 'Create report'

      fill_in "Email", with: 'batman@gotham.city'
      fill_in "Subject", with: 'My diet'
      fill_in "Comments", with: "I'm fat, batman?! Help me!"
      click_on 'Create Report'
      within ".page-header" do
        page.should have_content 'Food tracker'
      end
    end
  end

  describe "show report" do
    before { @activity = FactoryGirl.create :activity, user: user }
    before { @report = FactoryGirl.create :report, user: user     }
    before { visit report_path(@report) }
    specify { page.should have_content(@activity.description) }
  end

end