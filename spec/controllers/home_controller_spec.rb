require 'spec_helper'

describe HomeController do
  it "redirects to 404 when user does not exist" do
    expect{ get :show, :format => :pdf }.to raise_error
  end

end
