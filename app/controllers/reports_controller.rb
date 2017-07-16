class ReportsController < ApplicationController

  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    flash[:notice] = "Report was succesfully trashed."
      redirect_to reports_path
  end
end
