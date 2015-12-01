class PlacesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  before_action :require_current_place, :only => [:show, :edit, :update, :destroy]

  def index
    @places = Place.all.paginate(:page => params[:page], :per_page => 5).order("created_at ASC")
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.create(place_params)
    if @place.valid?
      redirect_to places_path
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def show
    @comment = Comment.new
    @photo = Photo.new
  end

  def edit
  end

  def update
    current_place.update_attributes(place_params)
    if current_place.valid?
      redirect_to places_path
    else
      return render :edit, :status => :unprocessable_entity
    end
  end

  def destroy
    current_place.destroy
    redirect_to places_path
  end

  private

  def require_current_place
    render_not_found unless current_place.present?
  end

  helper_method :current_place
  def current_place
    @current_place ||= Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :address, :description)
  end
end
