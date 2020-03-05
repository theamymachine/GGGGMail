class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @email = Email.new(object: Faker::Food.dish, body: Faker::Food.description)
    if @email.save
      respond_to do |format|
        format.html { redirect_to emails_path }
        format.js { }
      end      
    else
      redirect_to root_path
      flash[:notice] = "Veuillez ré-essayer"
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def update 
    @email = Email.find(params[:id])
    @email.update(read_status: !@email.read_status)
  end

  def show
    @email = Email.find(params[:id])
    @email.read_status = true
    @email.save 

    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end      
  end

private

  def email_params
    params.permit(:object, :body, :read_status)
  end

end
