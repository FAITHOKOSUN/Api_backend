class AnimalsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  before_action :set_animal, only: [:show, :update, :destroy]

  # GET /animals
  def index
    page = params.fetch(:page, 1).to_i
    per_page = 20

    @animals = Rails.cache.fetch("animals_page_#{page}", expires_in: 1.hour) do
      Animal.paginate(page: page, per_page: per_page)
    end

    render json: @animals
  end

  # GET /animals/1
  def show
    render json: @animal
  end

  # POST /animals
  def create
    @animal = Animal.new(animal_params)

    if @animal.save
      render json: @animal, status: :created, location: @animal
    else
      render json: { error: 'Invalid parameters' }, status: :bad_request
    end
  end

  # PATCH/PUT /animals/1
  def update
    if @animal.update(animal_params)
      render json: @animal
    else
      render json: { errors: @animal.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /animals/1
  def destroy
    @animal = Animal.find_by(id: params[:id])
    if @animal
      @animal.destroy
      # Respond with a success status code (e.g., 204 No Content)
      head :no_content
    else
      # Respond with a not found status code (e.g., 404 Not Found)
      render json: { error: 'Animal not found' }, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def animal_params
      params.require(:animal).permit(:name, :order, :family)
    end
end
