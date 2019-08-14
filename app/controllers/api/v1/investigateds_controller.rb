class Api::V1::InvestigatedsController < Api::V1::BaseController

  before_action :authenticate_api_user!
  before_action :set_investigated, only: [:show, :edit, :update, :destroy]

  # GET /investigateds
  # GET /investigateds.json
  def index 


    @investigateds = Investigated.all
    total_count = @investigateds.count
    respond_to do |format|
      format.html {  }
      format.json { render json: { total: total_count,  investigateds: @investigateds.map { |s| {id: s.id, name:  s.name, lastname1:  s.lastname1  } } } }
    end
  end

  # GET /investigateds/1
  # GET /investigateds/1.json
  def show
  end

  # GET /investigateds/new
  def new
    @investigated = Investigated.new
  end

  # GET /investigateds/1/edit
  def edit
  end

  # POST /investigateds
  # POST /investigateds.json
  def create
    @investigated = Investigated.new(investigated_params)

    respond_to do |format|
      if @investigated.save
        format.html { redirect_to @investigated, notice: 'Investigated was successfully created.' }
        format.json { render :show, status: :created, location: @investigated }
      else
        format.html { render :new }
        format.json { render json: @investigated.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investigateds/1
  # PATCH/PUT /investigateds/1.json
  def update
    respond_to do |format|
      if @investigated.update(investigated_params)
        format.html { redirect_to @investigated, notice: 'Investigated was successfully updated.' }
        format.json { render :show, status: :ok, location: @investigated }
      else
        format.html { render :edit }
        format.json { render json: @investigated.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investigateds/1
  # DELETE /investigateds/1.json
  def destroy
    @investigated.destroy
    respond_to do |format| 
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investigated
      @investigated = Investigated.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investigated_params
      params.require(:investigated).permit(:name, :lastname1)
    end
end
