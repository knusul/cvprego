class LanguagesController < ApplicationController
  before_filter :authenticate_user!
  # GET /languages.json
  def index
    render json: current_user.languages
  end

  # GET /languages/1.json
  def show
    language = current_user.languages.find(params[:id])
    render json: language
  end

  # POST /languages.json
  def create
    language = current_user.languages.build
    if update_language(language)
      render json: language, status: :created
    else
      render json: language.errors, status: :unprocessable_entity
    end
  end

  # PUT /languages/1.json
  def update
    language = current_user.languages.find(params[:id])
    if update_language(language)
      render json: language, status: :ok
    else
      render json: language.errors, status: :unprocessable_entity
    end
  end

  # DELETE /languages/1.json
  def destroy
    language = current_user.languages.find(params[:id])
    language.destroy
    render json: nil, status: :ok
  end

private

  def permitted_params
    params.require(:language).permit(:name,
                                    :level
                                    )
  end

  def update_language(language)
    language_params = permitted_params
    language.attributes = language_params
    language.save
  end
end
