require "rails_helper"

RSpec.describe Order, type: :model do
  context "validations tests" do
    it "ensures the quantity is present" do
      order = Order.new(quantity: 1)
      expect(order.valid?).to eq(false)
    end

    it "ensures the company_id is present" do
      order = Order.new(company_id: 1)
      expect(order.valid?).to eq(false)
    end

    it "should be able to save order" do
      order = Order.new(quantity: 31, company_id: 1)
      expect(order.save).to eq(true)
    end

  end

end