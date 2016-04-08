require "rails_helper"

RSpec.describe Taco, :type => :model do
  it "has a store association" do
    expect(Taco.first.stores).not_to be_empty
  end

  it "has a unique_stores method" do
    expect(Taco.first.unique_stores.map{|obj| obj.name}.uniq!).to eq(nil)
  end
end
