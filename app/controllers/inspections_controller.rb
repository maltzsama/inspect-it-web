class InspectionsController < ApplicationController
  def index
    @inspections = Inspection.all
  end

  def new
    @inspection = Inspection.new
  end

  def destroy
  end

  def show
  end

  def edit
  end

  def create
  end
end
