class LineItemsController < ApplicationController
  before_filter :load_donation

  def create
    @line_item = @donation.line_items.build(params[:line_item])
    if @line_item.save
      flash[:success] = "Item added"
      redirect_to edit_donation_path(@donation)
    else
      render :new
    end
  end

  def destroy
    @line_item = @donation.line_items.find(params[:id])
    @line_item.destroy
    flash[:success] = "Item removed"
    redirect_to edit_donation_path(@donation)
  end

  private

  def load_donation
    @donation = Donation.find(params[:donation_id])
  end
end
