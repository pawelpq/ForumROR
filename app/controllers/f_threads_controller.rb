class FThreadsController < ApplicationController
  before_action :set_f_thread, only: [:show, :edit, :update, :destroy]

  # GET /f_threads
  # GET /f_threads.json
  def index
    @f_threads = FThread.all
  end

  # GET /f_threads/1
  # GET /f_threads/1.json
  def show
  end

  # GET /f_threads/new
  def new
    @f_thread = FThread.new
  end

  # GET /f_threads/1/edit
  def edit
  end

  # POST /f_threads
  # POST /f_threads.json
  def create
    @f_thread = FThread.new(f_thread_params)
    @f_thread.date = Time.now
    respond_to do |format|
      if @f_thread.save
        format.html { redirect_to @f_thread, notice: 'F thread was successfully created.' }
        format.json { render action: 'show', status: :created, location: @f_thread }
      else
        format.html { render action: 'new' }
        format.json { render json: @f_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /f_threads/1
  # PATCH/PUT /f_threads/1.json
  def update
    respond_to do |format|
      if @f_thread.update(f_thread_params)
        format.html { redirect_to @f_thread, notice: 'F thread was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @f_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /f_threads/1
  # DELETE /f_threads/1.json
  def destroy
    @f_thread.destroy
    respond_to do |format|
      format.html { redirect_to f_threads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_f_thread
      @f_thread = FThread.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def f_thread_params
      params.require(:f_thread).permit(:subject, :date, :sub_category_id)
    end
end
