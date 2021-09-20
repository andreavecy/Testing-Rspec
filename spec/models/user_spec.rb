require 'rails_helper'

RSpec.describe User, type: :model do

  it 'name should be present' do
    user = User.new(name: nil, last_name: "Vecino")
    expect(user).to_not be_valid
  end

  it 'last name should be present' do
    user = User.new(name: "Andrea", last_name: nil)
    expect(user).to_not be_valid
  end

  let(:user) { User.create(name: "Andrea", last_name: "Vecino") }
  it "full name is valid" do
    expect(user.full_name).to eq("Andrea Vecino")
  end

  let(:first_bmi) { Bmi.create(mass: 60.0, height: 160.0) }
  let(:second_bmi) { Bmi.create(mass: 70.0, height: 170.0) }
  let(:user_with_bmis) { User.create(name: "Andrea", last_name: "Vecino", bmis: [first_bmi, second_bmi]) }
  let(:expected_result) { 23.829476643598618 }
  let(:last_bmi) { [24.22145328719723] }
  it "calculate bmi average" do
    expect(user_with_bmis.bmi_average).to eq(expected_result)
  end

  it "get most_recent_bmi" do
    expect(user_with_bmis.most_recent_bmi(1)).to eq(last_bmi)
  end
end
