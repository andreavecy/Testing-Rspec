require 'rails_helper'

RSpec.describe Bmi, type: :model do

  let(:mass) { 60.0 }
  let(:height) { 170.0 }
  let(:bmi) { Bmi.create(mass: mass, height: height) }
  let(:expected_result) { 20.761245674740486 }
  it "calculate bmi average" do
    expect(Bmi.calculate(mass, height)).to eq(expected_result)
  end
end
