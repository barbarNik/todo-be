class ItemsController < ApplicationController

  # GET /items
  def index
    @items = current_user.items
    json_response(@items.order(:created_at))
  end

  # POST /items
  def create
    @item = current_user.items.create!(item_params)
    json_response(@item, :created)
  end

  # GET /items/:id
  def show
    json_response(current_user.items.find(params['id']))
  end

  # PUT /items/:id
  def update
    current_user.items.find(params['id']).update(item_params)
    head :no_content
  end

  # DELETE /items/:id
  def destroy
    current_user.items.find(params['id']).destroy
    head :no_content
  end

  private

  def item_params
    # whitelist params
    params.permit(:text, :done)
  end

end
