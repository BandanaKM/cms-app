class SubjectsController < ApplicationController

layout 'admin' 

  def index
    @subjects = Subject.sorted
  end

  # @subjects = Subject.order("position ASC")
  # @subjects = Subject.all 

  def show
    @subject = Subject.find(params[:id])
  end

  #this is how we find the id in the URL string. this will assign it to our instance variable @subject which will then make it available to our template

  def new
    @subject = Subject.new(:name => "Default")
  end

  #what instance variable do we need?
  #having an object for our form allows us to set default values for the objects attributes (like visible false)

  def create
  # Instantiate a new object using form parameters
  @subject = Subject.new(subject_params)
  # Save the object
    if @subject.save 
    # If save succeeds, redirect to the index action
      flash[:notice] = "Subject created successfully."
      redirect_to(:action => 'index')
    else 
    # If save fails, redisplay the form so the user can fix the problem 
      render('new')
    end 
  end 

  def edit
    @subject = Subject.find(params[:id])

    # we need to find the subject to edit so that we can prepopulate the form on the edit template with the current values 
    # we can find the entry, just like we did for show
  end

  #edit and update will require there be an id. so we can update an existing record. 

   def update
   # Find an existing object using form parameters
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
   # If update succeeds, redirect to the index action
      flash[:notice] = "Subject updated successfully."
      redirect_to(:action => 'show', :id => @subject.id)
      else 
   # If update fails, redisplay the form so the user can fix the problem 
        render('edit')
      end 
  end 

  def delete
    @subject = Subject.find(params[:id])  
  end

  def destroy
    subject = Subject.find(params[:id])  
    subject.destroy
    flash[:notice] = "Subject '#{subject.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end 

  #we left subject as a local variable. that's because the subject is going to be equal to this object. after its been destroyed, we'll still have access to it.

  private

    def subject_params
      params.require(:subject).permit(:name, :position, :visible)
    end 

    #same as using 'params[:subject]', except that it raises an error if :subject is not present and allows listed attributes to be mass-assigned 

end
