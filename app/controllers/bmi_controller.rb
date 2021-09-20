class BmiController < ApplicationController

  def create
    @bmi = Bmi.new(bmi_params)
    if @bmi.save
      render json: { user: user(@bmi.user_id).full_name, bmi: Bmi.calculate(@bmi.mass, @bmi.height), bmi_average: user(@bmi.user_id).bmi_average }
    else
      render json: @bmi.errors, status: :unprocessable_entity
    end
  end

  def user(id)
    User.find(id)
  end

  private

  def bmi_params
    params.permit(:user_id, :mass, :height)
  end

end
