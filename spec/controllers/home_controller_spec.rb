require 'spec_helper'

describe HomeController do
  it "redirects to 404 when user does not exist" do
    expect{ get :show }.to raise_error
  end

end
