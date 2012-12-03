require 'flash-dance'
require 'action_controller'

class DummyController < ActionController::Base
	def index
	end
end

describe FlashDance::ControllerHelpers do
	# going to create a dummy class and test that it acts as intended for the specified methods
	before(:each) do
		@view = ActionView::Base.new
		@controller = ActionController::Base.new
		@view.controller = @controller
	end

	it "returns nothing in the flash if it's not set" do
			@controller.stub!(:flash).and_return({})
			@view.flash.length.should == 0
	end

	context "flash_me" do
		it "responds to flash_me method" do
			@controller.should respond_to :flash_me
		end
		
		describe DummyController do
			it "sets flash with specified message" do
				@dummy = DummyController.new
				@dummy.flash_me(:error, "error msg")
				get :controller => @dummy, :action => "index"
				flash[:error].should_not be nil
				#@controller.flash_me(:error, "test message")
				#@view.flash[:error].length.should == 1
			end
		end #end describe block
	end # end context 'flash_me'

	it 'flash is set before flash_me is called' do
		#it should handle it gracefully
	end
end
