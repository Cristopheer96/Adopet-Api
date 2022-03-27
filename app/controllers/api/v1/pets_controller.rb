class Api::V1::PetsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ] #la authenticacion se con esta gema pero que se salte en estos endpoint
  before_action :set_pet, only: [:show, :update]
  def index
    @pets = policy_scope(Pet)

    # render json: @pets, status: :ok
  end

  def show
  end

  def update
    if @pet.update(strong_params)
      render :show
    else
      render_error
    end
  end

  def create
    @pet = current_user.owner.pets.build(strong_params)
    authorize @pet

    if @pet.save
      render :show
    else
      render_error
    end

  end
  def destroy
    @pet = Pet.find(params[:id])
    @namepet = @pet.name
    authorize @pet
    if @pet.delete
      render json: {status: "#{@namepet} fue eliminado :'( "}
    else
      render json: {error: "#{@namepet} no pudo ser fue eliminado :))) "}
    end

  end

  private
  def set_pet
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def strong_params
    params.require(:pet).permit(:gender, :name, :age, :state, :coatsize, :ubication, :size)

  end
  def render_error
    render json:{ errors: "Los errores son: #{@pet.errors.full_messages} " }, status: :unprocessable_entity
  end
end
