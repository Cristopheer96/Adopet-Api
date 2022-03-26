class Api::V1::PetsController < Api::V1::BaseController
  def index
    @pets = policy_scope(Pet)
    render json: @pets, status: :ok
  end
end
