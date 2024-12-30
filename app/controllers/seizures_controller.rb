class SeizuresController < ApplicationController
  before_action :set_person
  before_action :set_seizure, only: %i[ show edit update destroy ]

  # GET people/:person_id/seizures or people/:person_id/seizures.json
  def index
    @seizures = @person.seizures.all
  end

  # GET people/:person_id/seizures/1 or people/:person_id/seizures/1.json
  def show
  end

  # GET people/:person_id/seizures/new
  def new
    @seizure = @person.seizures.new
  end

  # GET people/:person_id/seizures/1/edit
  def edit
  end

  # POST people/:person_id/seizures or people/:person_id/seizures.json
  def create
    @seizure = @person.seizures.new(seizure_params)

    respond_to do |format|
      if @seizure.save
        format.html { redirect_to person_path(@person), notice: "Seizure was successfully created." }
        format.json { render :show, status: :created, location: @seizure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @seizure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT people/:person_id/seizures/1 or people/:person_id/seizures/1.json
  def update
    respond_to do |format|
      if @seizure.update(seizure_params)
        format.html { redirect_to person_path(@pereson), notice: "Seizure was successfully updated." }
        format.json { render :show, status: :ok, location: @seizure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @seizure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE people/:person_id/seizures/1 or people/:person_id/seizures/1.json
  def destroy
    @seizure.destroy!

    respond_to do |format|
      format.html { redirect_to seizures_path, status: :see_other, notice: "Seizure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params.expect(:person_id))
    end

    def set_seizure
      @seizure = @person.seizures.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def seizure_params
      params.expect(seizure: [ :start_time, :end_time ])
    end
end
