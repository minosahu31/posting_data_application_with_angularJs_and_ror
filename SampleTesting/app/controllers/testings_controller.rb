class TestingsController < ApplicationController
  before_action :set_testing, only: [:show, :edit, :update, :destroy]

  # GET /testings
  # GET /testings.json
  def index
    @testings = Testing.all
    render json: {success: true, testings: @testings}
  end

  # GET /testings/1
  # GET /testings/1.json
  def show
    render json: { success: true, testing: @testing }
  end

  # GET /testings/new
  def new
    @testing = Testing.new
    render json: { success: true, testing: @testing }
  end

  # POST /testings
  # POST /testings.json
  def create
    @testing = Testing.new(testing_params)
      if @testing.save
        @testings = Testing.all
          render json: {success: true, testings: @testings}
        # render json: { success: true, message: "Created successfully....", testing: @testing }
      else
        #html { render :new }
        #format.json {
        render json: {success: false, testing_errors: @testing.errors, status: :unprocessable_entity}
        #}
      end
    #end
  end

  # GET /testings/1/edit
  def edit
    render json: { success: true, testing: @testing }
  end

  # PATCH/PUT /testings/1
  # PATCH/PUT /testings/1.json
  def update
      if @testing.update(testing_params)
        @testings = Testing.all
        render json: {success: true, testings: @testings}
      else
        render json: {success: false, testing_errors: @testing.errors, status: :unprocessable_entity}
      end
  end

  # DELETE /testings/1
  # DELETE /testings/1.json
  def destroy
    @testing.destroy
    @testings = Testing.all
    render json: {success: true, testings: @testings}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testing
      @testing = Testing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testing_params
      params.permit(:title, :description)
    end
end
