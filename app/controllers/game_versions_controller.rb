class GameVersionsController < ApplicationController
  before_action :set_game_version, only: %i[ show edit update destroy ]
  before_action :set_game, only: %i[ index create new ]

  # GET /game_versions or /game_versions.json
  def index
    @game_versions = policy_scope(@game.game_versions)
  end

  # GET /game_versions/1 or /game_versions/1.json
  def show
  end

  # GET /game_versions/new
  def new
    @game_version = @game.game_versions.build
    authorize @game_version
  end

  # GET /game_versions/1/edit
  def edit
  end

  # POST /game_versions or /game_versions.json
  def create
    @game_version = @game.game_versions.build(game_version_params)
    @game_version.user = current_user

    authorize @game_version

    respond_to do |format|
      if @game_version.save
        format.html { redirect_to game_version_url(@game_version), notice: "Game version was successfully created." }
        format.json { render :show, status: :created, location: @game_version }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_versions/1 or /game_versions/1.json
  def update
    respond_to do |format|
      if @game_version.update(game_version_params)
        format.html { redirect_to game_version_url(@game_version), notice: "Game version was successfully updated." }
        format.json { render :show, status: :ok, location: @game_version }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_versions/1 or /game_versions/1.json
  def destroy
    @game_version.destroy!

    respond_to do |format|
      format.html { redirect_to game_versions_url, notice: "Game version was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_version
      @game_version = GameVersion.find(params[:id])
      authorize @game_version
    end

    def set_game 
      @game = Game.find(params[:game_id])
    end

    # Only allow a list of trusted parameters through.
    def game_version_params
      params.require(:game_version).permit(:game_id, :scripts, :level)
    end
end
