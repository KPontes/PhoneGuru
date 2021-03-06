class ManagesController < ApplicationController
  before_action :set_manage, only: [:show, :edit, :update, :destroy, :newsubordinate]
  before_action :newsub, only: [:newsubordinate]

  # GET /manages
  # GET /manages.json
  def index
    @manages = Manage.all
  end

  # GET /manages/1
  # GET /manages/1.json
  def show
  end

  # GET /manages/new
  def new
    @manage = Manage.new
  end

  # GET /manages/1/edit
  def edit
  end

  def newsubordinate

  end

  # POST /manages
  # POST /manages.json
  def create

    _msg = ""
    @manage = Manage.new

    @manage.created_at = Time.now
    @manage.updated_at = Time.now
    
    n = Number.find_by(number: params["manage"]["manager_id"])
    if !(n.nil?)  then
      @manage.manager_id = n.id
    else
      _msg = 'Manager number do not exist'
    end
    
    n = Number.find_by(number: params["manage"]["subordinate_id"])
    if !(n.nil?)  then
      @manage.subordinate_id = n.id
    else
      _msg = 'Manager number do not exist'
    end

    #byebug
    respond_to do |format|
      #if notice != "" then
      #  format.html { redirect_to @manage, notice: _msg }
      #  return
      #end
      
      if @manage.save
        format.html { redirect_to action: 'index', notice: 'Manage was successfully created.' }
        format.json { render :show, status: :created, location: @manage }
      else
        format.html { render :new }
        format.json { render json: @manage.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /manages/1
  # PATCH/PUT /manages/1.json
  def update

    respond_to do |format|
      @manage = Manage.new
      if @manage.update(manage_params)
        format.html { redirect_to @manage, notice: 'Manage was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage }
      else
        format.html { render :edit }
        format.json { render json: @manage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manages/1
  # DELETE /manages/1.json
  def destroy
    @manage.destroy

    respond_to do |format|
      format.html { redirect_to action: 'index', notice: 'Manage was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage
      begin
        @manage = Manage.find(params[:id])
      rescue
        redirect_to manages_path
      end      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manage_params
      params.require(:manage).permit(:manager_id, :subordinate_id)
    end
    
    def newsub
      _msg = ""
      @manage = Manage.new
  
      @manage.created_at = Time.now
      @manage.updated_at = Time.now
      
      n = Number.find_by(id: params["id"])
      if !(n.nil?)  then
        @manage.manager_id = n.id
        @manage.subordinate_id = nil
      else
        _msg = 'Manager number do not exist'
      end     
    end
end
