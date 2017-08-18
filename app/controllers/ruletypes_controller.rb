class RuletypesController < ApplicationController
  before_action :set_ruletype, only: [:show, :edit, :update, :destroy]

  # GET /ruletypes
  # GET /ruletypes.json
  def index
    @ruletypes = Ruletype.all
  end

  # GET /ruletypes/1
  # GET /ruletypes/1.json
  def show
  end

  # GET /ruletypes/new
  def new
    @ruletype = Ruletype.new
  end

  # GET /ruletypes/1/edit
  def edit
  end

  # POST /ruletypes
  # POST /ruletypes.json
  def create
    @ruletype = Ruletype.new(ruletype_params)

    respond_to do |format|
      if @ruletype.save
        format.html { redirect_to @ruletype, notice: 'Ruletype was successfully created.' }
        format.json { render :show, status: :created, location: @ruletype }
      else
        format.html { render :new }
        format.json { render json: @ruletype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ruletypes/1
  # PATCH/PUT /ruletypes/1.json
  def update
    respond_to do |format|
      if @ruletype.update(ruletype_params)
        format.html { redirect_to @ruletype, notice: 'Ruletype was successfully updated.' }
        format.json { render :show, status: :ok, location: @ruletype }
      else
        format.html { render :edit }
        format.json { render json: @ruletype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ruletypes/1
  # DELETE /ruletypes/1.json
  def destroy
    @ruletype.destroy
    respond_to do |format|
      format.html { redirect_to ruletypes_url, notice: 'Ruletype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ruletype
      @ruletype = Ruletype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ruletype_params
      params.require(:ruletype).permit(:name)
      # params.fetch(:ruletype, {})
    end
end
