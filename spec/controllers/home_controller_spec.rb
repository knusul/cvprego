require 'spec_helper'

describe HomeController do
  it "redirects to 404 when user does not exist" do
    expect{ get :show, :format => :pdf }.to raise_error
  end

  it "render 406 on unknown format " do
    get :show, :format => :html
    response.code.should == "406"
  end

end
