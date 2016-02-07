class PreferencesController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create]
  before_action :set_preference, only: [:show]

  def index
    @preferences = Preference.all
  end

  def show
  end

  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.create(preference_params)
    respond_with @preference
  end

  private

  def preference_params
    params.require(:preference).permit(:name)
  end

  def set_preference
    @preference = Preference.find(params[:id])
  end
end