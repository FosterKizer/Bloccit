require 'rails_helper'

describe Vote do
	describe "validations" do
		describe "value validation" do
			describe "when greater than 1" do
				subject { Vote.new(value: 2) }
				it { should_not be_valid }
			end
			
			describe "when equal to 1" do
				subject { Vote.new(value: 1) }
				it { should be_valid }
			end
			
			describe "when equal to 0" do
				subject { Vote.new(value: 0) }
				it { should_not be_valid }
			end
			
			describe "when equal to -1" do
				subject { Vote.new(value: -1) }
				it { should be_valid }
			end
			
			describe "when less than -1" do
				subject { Vote.new(value: -2) }
				it { should_not be_valid }
			end
		end
	end
end	
