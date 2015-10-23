class TablesController < ApplicationController
  respond_to :json
  def index
    @tables = Table.all
    respond_with @tables
  end

  def show
    @table = Table.find(params[:id])
    respond_with @table
  end

  def create
    @table = Table.create(table_params)
    respond_with @table
  end

  def update
    @table = Table.find(params[:id]).update_attributes(table_params)
    respond_with @table
  end

  def destroy
    @table = Table.find(params[:id]).destroy
    respond_with @table
  end

  private
    def table_params
      params.require(:table).permit(:name)
    end
end