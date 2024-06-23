class GeminiConfigsController < ApplicationController
  before_action :set_gemini_config, only: %i[ show edit update ]

  # GET /gemini_configs or /gemini_configs.json
  def index
    @gemini_configs = GeminiConfig.all

    authorize @gemini_configs
  end

  # GET /gemini_configs/1 or /gemini_configs/1.json
  def show
  end

  # GET /gemini_configs/new
  def new
    @gemini_config = GeminiConfig.new
    authorize @gemini_config
  end

  # GET /gemini_configs/1/edit
  def edit
  end

  # POST /gemini_configs or /gemini_configs.json
  def create
    @gemini_config = GeminiConfig.new(gemini_config_params)

    authorize @gemini_config

    respond_to do |format|
      if @gemini_config.save
        format.html { redirect_to gemini_config_url(@gemini_config), notice: "Gemini config was successfully created." }
        format.json { render :show, status: :created, location: @gemini_config }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gemini_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gemini_configs/1 or /gemini_configs/1.json
  def update
    respond_to do |format|
      if @gemini_config.update(gemini_config_params)
        format.html { redirect_to gemini_config_url(@gemini_config), notice: "Gemini config was successfully updated." }
        format.json { render :show, status: :ok, location: @gemini_config }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gemini_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gemini_configs/1 or /gemini_configs/1.json
  # def destroy
  #   @gemini_config.destroy!

  #   respond_to do |format|
  #     format.html { redirect_to gemini_configs_url, notice: "Gemini config was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gemini_config
      @gemini_config = GeminiConfig.find(params[:id])
      authorize @gemini_config
    end

    # Only allow a list of trusted parameters through.
    def gemini_config_params
      params.require(:gemini_config).permit(:maximum_tokens, :documentation)
    end
end
