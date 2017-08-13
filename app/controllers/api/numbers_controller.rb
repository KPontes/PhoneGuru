class Api::NumbersController < ActionController::API
  before_action :set_number_num, only: [:number_retrieve]
  before_action :set_number_fields, only: [:number_create]


  def number_retrieve
    render json: @number
  end

  def number_create
    set_number_fields
    if @number.save
      render json: @number
    else
      render json: @number.errors
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_number
      @number = Number.find(params[:id])
    end

    def set_number_num
      @number = Number.find_by(number: params[:num])
    end
    
    def set_number_fields
      @number =  Number.new
      @number.number = params[:number]
      @number.cn = params[:cn]
      @number.prefix = params[:prefix]
      @number.mcdu = params[:mcdu]
      @number.countrycode = params[:countrycode]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def number_params
      params.require(:number).permit(:number, :cn, :prefix, :mcdu, :countrycode, :validation)
    end
end
