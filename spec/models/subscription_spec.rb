require 'spec_helper'

describe Subscription do
  describe "#can_send_message?" do
  	before(:each) do
  		@zach = User.create!
    	@sub = Subscription.new(
				max_messages: 1,
				user: @zach
    	) 
  	end

    context "when a user has not reached the subscription limit for the month" do
      it "returns true" do
				@zach.sent_messages.count.should eq(0)
				@sub.can_send_message?.should be_true
      end
    end
    
    context "when a user has reached the subscription limit for the month" do
      before(:each) do
      	@david = User.create!
      	@zach.subscription = @sub
      end

      it "returns false" do
	 			@zach.send_message(
	 				title: "Book Update",
					text: "Beta 11 includes great stuff!",
					recipient: @david
	 			)
				# @zach.sent_messages.stub(:count).and_return 2
				@zach.sent_messages.count.should eq(1)
				@sub.can_send_message?.should be_false
      end
    end
  end
end
