class ReportsController < ApplicationController

  before_action :check_if_tho , :except => [:index, :show, :search, :create , :new]
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end


  def search
    @reports = Report.all
    if params[:search]
      @reports = Report.search(params[:search]).order("created_at DESC")
    else
      @reports = Report.all.order("created_at DESC")
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    flash[:notice] = "Report was succesfully trashed."
      redirect_to reports_path
  end


  def new
    @report = Report.new
  end

  def create
    @report = Report.new(params.require(:report).permit(:name, :description, :category, :reporter_name, :created_at))
    @report.created_at = Time.now

    if @report.save
      flash[:notice] = "Product has been successfully created."
      redirect_to @report
    else
      render :action => "new"
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update_attributes(params.require(:report).
      permit(:name, :category, :description, :reporter_name,
      :created_at))
      redirect_to @report, notice: 'Report Update Successful'
    else
      render action: 'edit'
    end
  end
private


def check_if_tho
 authenticate_or_request_with_http_basic("Products Realm") do |username, password|
   username == "admin" and password == "sTr0NG_p4$swOrD"
 end
end



end
