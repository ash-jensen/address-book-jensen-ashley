class PeopleController < ApplicationController
  before_action :require_user
  before_action :correct_user, only: [ :edit, :update, :destroy, :show ]
  before_action :set_person, only: %i[ show edit update destroy ]
 
  # GET /people or /people.json
  def index
    @people = current_user.people.all
    @person = current_user.people.build
    @address = Address.new
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = current_user.people.build
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people or /people.json
  def create
    @person = current_user.people.build(person_params)
    @people = current_user.people.all

    respond_to do |format|
      if @person.save
        format.html { redirect_to people_url, notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to people_url, notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @person = current_user.people.find_by(id: params[:id])
    redirect_to people_path, notice: "You are not authorized to access this content" if @person.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:salutation, :first_name, :middle_name, :last_name, :ssn, :birth_date, :comment, :user_id)
    end

end
