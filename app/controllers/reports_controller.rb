class ReportsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @reports = Report.all
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id], params[:report])

    respond_to do |format|
      if @report.valid?
        session[:report] = @report
        format.html { redirect_to report_path(@report)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @report = params[:id] == 'poundage' ? Report.find(params[:id]) : session[:report]
  end
end