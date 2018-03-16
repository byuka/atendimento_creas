class TechniciansController < ApplicationController
  before_action :procura_tecnico, only: [:show, :edit, :update]

  def index
    @tecnicos = Technician.all
    authorize @tecnicos
  end

  def show
  end

  def new
    @tecnico = Technician.new
    authorize @tecnico
  end

  def edit
  end

  def create
    @tecnico = Technician.new(technician_params)
    authorize @tecnico

    if @tecnico.save
        redirect_to @tecnico, notice: "Cadastrado com sucesso!"
    else 
        render :new
    end
  end

  def update
    if @tecnico.update(technician_params)
      authorize @tecnico
      redirect_to technicians_url, notice: "Dados atualizados com sucesso!"
    else
      render :edit
    end    
  end
  
  private
  def procura_tecnico
    @tecnico = Technician.find(params[:id])
    authorize @tecnico
  end

  def technician_params
    params.require(:technician).permit(:nome, :cargo, :matricula, :data_nascimento, :ativo)
  end
end
