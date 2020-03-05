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
        flash[:notice] = "Email reçu"
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

  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end      
  end

private

  def email_params
    params.permit(:object, :body)
  end

end
