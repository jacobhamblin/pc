require "rails_helper"

RSpec.describe Salsa, :type => :model do
  it "has a store association" do
    expect(Salsa.first.stores).not_to be_empty
  end

  it "has a unique_stores method" do
    expect(Salsa.first.unique_stores.map{|obj| obj.name}.uniq!).to eq(nil)
  end
end
