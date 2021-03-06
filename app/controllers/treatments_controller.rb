class TreatmentsController < ApplicationController
  def index
    @category = Category.find_by_name(params[:category])
    if @category
      @treatments = Treatment.sort_by_category(@category.id).where(visible: true)
    end
  end

  def show
    @treatment = Treatment.friendly.find(params[:id])  
  end
end
