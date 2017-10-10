class NumbersController < ApplicationController
  before_action :set_number, only: [:show, :edit, :update, :destroy]
  before_action :number_params, only: [:create]

  # GET /numbers
  # GET /numbers.json
  def index
    @numbers = Number.all
  end

  # GET /numbers/1
  # GET /numbers/1.json
  def show
    @ruletype = @number.ruletypes
  end

  # GET /numbers/new
  def new
    @ruletype = Ruletype.all
    @number = Number.new
  end

  # GET /numbers/1/edit
  def edit
    @ruletype = Ruletype.all
  end

  # POST /numbers
  # POST /numbers.json
  def create
    @number = Number.new(number_params)

    respond_to do |format|
      if @number.save
        ruletype_params
        params["ruletype"]["ruletype_id"].each do |rtids|
          @nrt = NumberRuletype.new
          @nrt.number_id = @number.id
          @nrt.ruletype_id = rtids
          @nrt.save
        end        
        format.html { redirect_to @number, notice: 'Number was successfully created.' }
        format.json { render :show, status: :created, location: @number }
      else
        format.html { render :new }
        format.json { render json: @number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /numbers/1
  # PATCH/PUT /numbers/1.json
  def update
    respond_to do |format|

      if @number.update(number_params)
        # byebug
        NumberRuletype.where(number_id: @number.id).destroy_all

        params["ruletype"]["ruletype_id"].each do |rtids|
          @nrt = NumberRuletype.new
          @nrt.number_id = @number.id
          @nrt.ruletype_id = rtids
          @nrt.save
        end
        format.html { redirect_to @number, notice: 'Number was successfully updated. ' + "#{params["ruletype"]["ruletype_id"]}"}
        format.json { render :show, status: :ok, location: @number }
      else
        format.html { render :edit }
        format.json { render json: @number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /numbers/1
  # DELETE /numbers/1.json
  def destroy
    @number.destroy
    respond_to do |format|
      format.html { redirect_to numbers_url, notice: 'Number was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_number
      @number = Number.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def number_params
      params.require(:number).permit(:number, :cn, :prefix, :mcdu, :countrycode, :validation)
    end

    def ruletype_params
      params.require(:ruletype).permit!
      # params[:number][:ruletype_ids]
    end
end
