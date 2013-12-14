require 'spec_helper'

describe Pomodoro do
	it 'raises an error if saved with no count' do
		pomodoro = Pomodoro.new
		expect { pomodoro.save! }.to raise_error(
				ActiveRecord::RecordInvalid
			) 
	end
end