require 'rails_helper'

RSpec.describe "Bmis", type: :request do
  describe "POST /create" do
    context "with valid parameters" do
      let(:user) { User.create(name: "Andrea", last_name: "Vecino") }
      let(:valid_params) do
        {
          user_id: user.id,
          mass: 55.0,
          height: 160.0
        }
      end

      it "create a new bmi record" do
        expect { post "/create_bmi", params: valid_params }.to change(Bmi, :count).by(+1)
        expect(response.status).to eq(200)
        json = JSON.parse(response.body).deep_symbolize_keys
        expect(json[:user]).to eq("Andrea Vecino")
        expect(json[:bmi]).to eq(21.484375)
        expect(Bmi.last.mass).to eq(55.0)
        expect(Bmi.last.height).to eq(160.0)
        expect(Bmi.last.user_id).to eq(user.id)
      end
    end

    context "with invalid parameters" do
      let(:user) { User.create(name: "Andrea", last_name: "Vecino") }
      let(:invalid_params) do
        {
          user_id: user.id,
          mass: "Hola",
          height: 160.0
        }
      end
      it "Invalid params request" do
        post "/create_bmi", params: invalid_params
        expect(response.status).to eq(422)
        json = JSON.parse(response.body).deep_symbolize_keys
        expect(json[:mass]).to eq(["is not a number"])
        expect(Bmi.count).to eq(0)
      end
    end
  end
end
