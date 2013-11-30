require 'spec_helper'

describe Location do
  %w(country city ip latitude longitude).each do |param|
    it "validate presence of any of #{param}" do
      expect(
        Location.create({ param => "foo" })
      ).to be_valid
    end
  end
end
