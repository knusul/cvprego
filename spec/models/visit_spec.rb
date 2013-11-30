require 'spec_helper'

describe Visit do
  describe ".visit" do
    context "with user" do
      let(:user){ FactoryGirl.create(:user) }

      it "adds location to when user with email exist" do
        expect do
          Visit.increase(user.email, {})
        end.to change{Visit.count}.by(1)
      end

      it "does not create empty locations" do
        expect do
          Visit.increase(user.email, {})
        end.to_not change{Location.count}
      end

      it "creates locations" do
        Location.any_instance.should_receive :save
        Visit.increase(user.email, {})
      end
    end
    
  end
end
