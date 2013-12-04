class LinksController < ApplicationController

  load_and_authorize_resource

  def create
    @linkable = @linkable || find_linkable
    @link = @linkable.links.build(params[:link])
    if @link.save
      flash[:notice] = 'The link has been added'
    else
      flash[:error] = 'Link URL cannot be blank'
    end
    redirect_to :back
  end

  def update
    @linkable = @linkable || find_linkable
    @link = @linkable.links.find(params[:id])
    if @link.update_attributes(params[:link])
      redirect_to :back, notice: 'The link was successfully updated'
    else
      flash[:error] = 'The URL cannot be blank'
      redirect_to :back
    end
  end

  def destroy
    @linkable = @linkable || find_linkable
    @link = @linkable.links.find(params[:id])
    @link.destroy
    flash[:notice] = 'The link has been deleted'
    redirect_to :back
  end

private

  def find_linkable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
