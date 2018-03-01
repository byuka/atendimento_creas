class TechniciansController < ApplicationController
  before_action :procura_tecnico, only: [:show, :edit, :update]

  def index
    @tecnicos = Technician.all
  end

  def show
  end

  def new
    @tecnico = Technician.new
  end

  def edit
  end

  def create
    @tecnico = Technician.new(technician_params)

    if @tecnico.save
        redirect_to @tecnico, notice: "Cadastrado com sucesso!"
    else 
        render :new
    end
  end

  def update
    if @tecnico.update(technician_params)
      redirect_to technicians_url, notice: "Dados atualizados com sucesso!"
    else
      render :edit
    end    
  end

  def destroy
    Technician.find(params[:id]).destroy
    redirect_to technician_url, notice: "Excluído com sucesso!"
  end

  private
  def procura_tecnico
    @tecnico = Technician.find(params[:id])
  end

  def technician_params
    params.require(:technician).permit(:nome, :cargo, :matricula, :data_nascimento, :ativo)
  end
end
