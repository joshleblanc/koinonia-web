class PackageVersionsController < ApplicationController
  before_action :set_package_version, only: %i[ show edit update destroy ]
  before_action :set_package, only: %i[ index create new ]

  # GET /package_versions or /package_versions.json
  def index
    @package_versions = policy_scope(@package.package_versions)
  end

  # GET /package_versions/1 or /package_versions/1.json
  def show
  end

  # GET /package_versions/new
  def new
    @package_version = @package.package_versions.build
    authorize @package_version
  end

  # GET /package_versions/1/edit
  def edit
  end

  # POST /package_versions or /package_versions.json
  def create
    @package_version = @package.package_versions.build(package_version_params)
    @package_version.user = current_user

    authorize @package_version

    respond_to do |format|
      if @package_version.save
        format.html { redirect_to package_version_url(@package_version), notice: "Package version was successfully created." }
        format.json { render :show, status: :created, location: @package_version }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @package_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /package_versions/1 or /package_versions/1.json
  def update
    respond_to do |format|
      if @package_version.update(package_version_params)
        format.html { redirect_to package_version_url(@package_version), notice: "Package version was successfully updated." }
        format.json { render :show, status: :ok, location: @package_version }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @package_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /package_versions/1 or /package_versions/1.json
  def destroy
    @package_version.destroy!

    respond_to do |format|
      format.html { redirect_to package_versions_url, notice: "Package version was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package_version
      @package_version = PackageVersion.find(params[:id])
      authorize @package_version
    end

    def set_package 
      @package = Package.find(params[:package_id])
    end

    # Only allow a list of trusted parameters through.
    def package_version_params
      params.require(:package_version).permit(:package_id, :levels, :scripts, :templates)
    end
end
