class PagesController < ApplicationController
 
layout 'admin' 


  def index
      @pages = Page.all
  end

  #if you want to write the scope, check out section 9 solutions

  def show
     @pages = Page.find(params[:id])
  end

  def new
    @page = Page.new(:name => "Default")
  end

  def create
    @page = Page.new(page_params)
    if @page.save 
     flash[:notice] = "Page created successfully."
      redirect_to(:action => 'index')
    else 
      render('new')
    end 
  end 

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated successfully."
      redirect_to(:action => 'show', :id => @page.id)
    else 
      render('edit')
    end 
  end 

  def delete
    @page = Page.find(params[:id])  
  end


  def destroy
    page = Page.find(params[:id])  
    page.destroy
    flash[:notice] = "Page '#{page.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end 

  private

  def page_params
    params.require(:page).permit(:name, :subject_id, :permalink, :position, :visible)
  end 

end
