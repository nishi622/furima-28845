require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  it "tokenがあれば保存ができること" do
    expect(@order).to be_valid
  end
  
end
