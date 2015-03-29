class ArchetypesController < ApplicationController
  before_action :set_archetype, only: [:show, :edit, :update, :destroy]

  def index
    #@archetypes = Archetype.only('ConceptScheme')
    @archetypes = Archetype.where routable: true
  end

  def show
  end

  def new
    @archetype = Archetype.new
  end

  def edit
  end

  def create
    @archetype = Archetype.new(resource_params)

    respond_to do |format|
      if @archetype.save
        format.html { redirect_to @archetype, notice: 'Archetype was successfully created.' }
        format.json { render :show, status: :created, location: @archetype }
      else
        format.html { render :new }
        format.json { render json: @archetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    respond_to do |format|
      if @archetype.update(resource_params)
        format.html { redirect_to @archetype, notice: 'Archetype was successfully updated.' }
        format.json { render :show, status: :ok, location: @archetype }
      else
        format.html { render :edit }
        format.json { render json: @archetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @archetype.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Archetype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def by_label
    label = Archetype.find_by literal: params[:literal].upcase
    @archetype = Archetype.find(label.parents.first.subject_id)
    if @archetype
      I18n.locale = label.language.name
      render "show"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archetype
      
      @archetype = Archetype.find_by name: params[:name], routable: true
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params[:resource]
    end
end
