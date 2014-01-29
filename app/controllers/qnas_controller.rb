class QnasController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_qna, only: [:show, :edit, :update, :destroy]

  # GET /qnas
  # GET /qnas.json
  def index
    @qnas = Qna.all
  end

  # GET /qnas/1
  # GET /qnas/1.json
  def show
  end

  # GET /qnas/new
  def new
    @qna = Qna.new
  end

  # GET /qnas/1/edit
  def edit
    @qna = Qna.find(params[:id])
  end

  # POST /qnas
  # POST /qnas.json
  def create
    @qna = Qna.new(qna_params)

    respond_to do |format|
      if @qna.save
        current_user.qnas << @qna
        format.html { redirect_to @qna, notice: 'Qna was successfully created.' }
        format.json { render action: 'show', status: :created, location: @qna }
      else
        format.html { render action: 'new' }
        format.json { render json: @qna.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qnas/1
  # PATCH/PUT /qnas/1.json
  def update
    respond_to do |format|
      if @qna.update(qna_params)
        current_user.qnas << @qna
        format.html { redirect_to @qna, notice: 'Qna was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @qna.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qnas/1
  # DELETE /qnas/1.json
  def destroy
    @qna.destroy
    respond_to do |format|
      format.html { redirect_to qnas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qna
      @qna = Qna.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qna_params
      params.require(:qna).permit(:question, :answer)
    end
end
