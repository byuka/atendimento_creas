class AssistancesController < ApplicationController
  before_action :procura_beneficio, only: [:show, :edit, :update]

  def index
    @beneficios = Assistance.all
    authorize @beneficios
  end

  def show
  end

  def new
    @beneficio = Assistance.new
    authorize @beneficio
  end

  def edit
  end

  def create
    @beneficio = Assistance.new(assistance_params)
    authorize @beneficio

        if @beneficio.save
            redirect_to @beneficio, notice: "Cadastrado com sucesso!"
        else 
            render :new
        end
  end

  def update
    if @beneficio.update(assistance_params)
      redirect_to assistances_url, notice: "Dados atualizados com sucesso!"
    else
      render :edit
    end    
  end
   
  private
  def procura_beneficio
    @beneficio = Assistance.find(params[:id])
    authorize @beneficio
  end

  def assistance_params
    params.require(:assistance).permit(:nome, :descricao, :ativo)
  end
end

