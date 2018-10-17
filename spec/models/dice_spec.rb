require 'rails_helper'

RSpec.describe Dice, type: :model do
  it "expects dice to roll a number" do
    dice = Dice.new
    expect(dice.roll.to_s).to match(/^[0-6]$/)
  end
end
