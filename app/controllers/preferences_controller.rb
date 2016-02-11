class PreferencesController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update,
                                             :destroy]
  before_action :set_preference, only: [:show, :edit, :update, :destroy]

  def index
    @preferences = Preference.all
  end

  def show
    @recipes = Recipe.where(preference_id: @preference.id)
  end

  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.create(preference_params)
    respond_with @preference
  end

  def edit
  end

  def update
    @preference.update(preference_params)
    respond_with @preference
  end

  def destroy
    @preference.destroy
    redirect_to root_path
  end

  private

  def preference_params
    params.require(:preference).permit(:name)
  end

  def set_preference
    @preference = Preference.friendly.find(params[:id]).decorate
  end
end
