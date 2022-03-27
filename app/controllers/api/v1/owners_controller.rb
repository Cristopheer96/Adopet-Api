class Api::V1::OwnersController < Api::V1::BaseController
    acts_as_token_authentication_handler_for User, except: [ :index] #la authenticacion se con esta gema pero que se salte en estos endpoint
  def index

  end
  def show
    @owner = current_user.owner
    authorize @owner
    render json: @owner

  end
  def create
    @owner = Owner.new(strong_params)
    @owner.user = current_user
    @owner.save
    authorize @owner

    if @owner.save
      render json: @owner
    else
      render json: {error: owner.errors.full_messages }
    end
  end

  def update
    @owner = current_user.owner
    authorize @owner

    if @owner.update(strong_params)
      render json: @owner
    else
      render json: {error: owner.errors.full_messages }
    end
  end

  def destroy
    @owner = current_user.owner
    authorize @owner

    if @owner.delete
      render json: {status: "fue eliminado  tu perfil de propiertario :'( "}
    else
      render json: {error: "no pudo ser fue eliminado tu perfil de Propietario :))) "}
    end
  end

  def strong_params
    params.require(:owner).permit(:phonenumber)

  end
end
