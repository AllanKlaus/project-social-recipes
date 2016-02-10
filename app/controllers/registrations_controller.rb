class RegistrationsController < Devise::RegistrationsController
  before_action :set_kitchens, only: [:edit, :update]

  def new
    super
  end

  def create
    super
  end

  def edit
    super
  end

  def update
    kitchens_params[:kitchens].each do |kitchen|
      resource.kitchens << Kitchen.find(kitchen)
    end
    resource.save
    super
  end


  private

  def set_kitchens
    @kitchens = Kitchen.all
  end

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :city)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :current_password,
                                 :city, :facebook, :twitter)
  end

  def kitchens_params
    params.require(:user).permit(:kitchens => [])
  end
end
