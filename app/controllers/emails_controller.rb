class EmailsController < ApplicationController
  before_action :set_email, only: %i[ show edit update destroy ]

  # GET /emails or /emails.json
  def index
    @emails = Email.all
  end

  # GET /emails/1 or /emails/1.json
  def show
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails or /emails.json
  def create
    person = Person.find_by(id: params[:person_id])
    
    if !person.present?
      flash[:notice] = "No person found"
      return
    end
    @email = person.emails.build(email_params)

    respond_to do |format|
      if @email.save
        format.html { redirect_to people_url, notice: "Email was successfully created." }
        format.json { render :show, status: :created, location: @email }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emails/1 or /emails/1.json
  def update
    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to people_url, notice: "Email was successfully updated." }
        format.json { render :show, status: :ok, location: @email }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1 or /emails/1.json
  def destroy
    @email.destroy

    respond_to do |format|
      format.html { redirect_to people_url, notice: "Email was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Check that the user is the correct user to gain access to the given content
  def correct_user
    @person = current_user.people.find_by(id: params[:id])
    redirect_to people_path, notice: "You are not authorized to access this content" if @person.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def email_params
      params.require(:email).permit(:email_address, :comment)
    end
end
