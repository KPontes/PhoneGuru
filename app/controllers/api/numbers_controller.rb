class Api::NumbersController < ActionController::API
  before_action :set_number_num, only: [:number_retrieve, :ruletype_retrieve, :subordinate_retrieve]
  before_action :set_number_fields, only: [:number_create]


  def number_retrieve
    render json: @number
  end
  
  def ruletype_retrieve
    @ruletype = @number.ruletypes
    render json: @ruletype
  end

  def subordinate_retrieve
    begin
      @mng = get_subordinates(@number.id)
    rescue
      render json: nil
      return
    end  
    
    _subordinate = Hash.new( "subordinate" )
    @mng.each do |mngd|
      _subordinate[mngd.subordinate_id] = Number.find(mngd.subordinate_id).number
    end

    render json: _subordinate
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
    
    def get_subordinates(manager_id)
      @mang = Manage.where("manager_id = ?", manager_id)
      return @mang
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def number_params
      params.require(:number).permit(:number, :cn, :prefix, :mcdu, :countrycode, :validation)
    end
end
