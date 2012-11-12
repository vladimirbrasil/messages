require 'spec_helper'

describe ApplicationController do
	controller do
		def index
			raise AccessDenied
		end

	end

  describe "handling AccessDenied exceptions" do
    it "redirects to the /401.html (access denied) page" do
      get :index
      response.should redirect_to('/401.html')
    end
  end
end