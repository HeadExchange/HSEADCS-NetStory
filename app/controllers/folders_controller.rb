class FoldersController < ApplicationController
  before_action :set_folder, only: [:show, :back, :edit, :update, :destroy]

  # GET /folders
  # GET /folders.json
  def index
    @folders = Folder.where(parent_id: nil)

    respond_to do |format|
      format.html
      format.js
    end
  end



  # GET /folders/1
  # GET /folders/1.json
  def show
    @folders = @folder.folders
    @articles = @folder.articles
    @parent_folder = @folder.parent_folder
    #@my_computer_folder = Folder.find_by_name('Мой компьютер')

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /folders/new
  def new
    @folder = Folder.new
  end

  def back
    @folders = @folder.folders
    @articles = @folder.articles
    @parent_folder = @folder.parent_folder
    @current_folder_id = params[:current_folder_id]

    respond_to do |format|
      #format.html
      format.js
    end
  end

  # GET /folders/1/edit
  def edit
  end

  # POST /folders
  # POST /folders.json
  def create
    @folder = Folder.new(folder_params)

    respond_to do |format|
      if @folder.save
        format.html { redirect_to @folder, notice: 'Folder was successfully created.' }
        format.json { render :show, status: :created, location: @folder }
      else
        format.html { render :new }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /folders/1
  # PATCH/PUT /folders/1.json
  def update
    respond_to do |format|
      if @folder.update(folder_params)
        format.html { redirect_to @folder, notice: 'Folder was successfully updated.' }
        format.json { render :show, status: :ok, location: @folder }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    @folder.destroy
    respond_to do |format|
      format.html { redirect_to folders_url, notice: 'Folder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder
      @folder = Folder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folder_params
      params.require(:folder).permit(:type, :name, :icon, :partial_name)
    end
end
