require 'spec_helper'

describe Report do
  it { should validate_presence_of :period_start  }
  it { should validate_presence_of :period_end    }
  it { should validate_presence_of :user_id       }
  it { should validate_presence_of :email         }
  it { should validate_presence_of :subject       }

  describe "should send email with access key after create" do
    before { @report = FactoryGirl.build :report }
    specify { expect{ @report.save}.to change(ActionMailer::Base.deliveries, :count).by(1) }
  end

  describe "should generate access key after create" do
    before { @report = FactoryGirl.create :report }
    specify { @report.key.length.should == 16 }
  end
end
