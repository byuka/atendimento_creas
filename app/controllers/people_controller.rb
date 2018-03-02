class PeopleController < ApplicationController
  before_action :procura_cidadao, only: [:show, :edit, :update, :destroy]

  def index
    @cidadaos = Person.all
  end

  def show
  end

  def new
    @cidadao = Person.new
  end

  def edit
  end

  def create
    @cidadao = Person.new(person_params)

    if @cidadao.save
      redirect_to @cidadao, notice: "Cadastrado com sucesso!"
    else 
      render :new
    end
  end

  def update
    if @cidadao.update(person_params)
      redirect_to people_url, notice: "Dados atualizados com sucesso!"
    else
      render :edit
    end      
  end

  def destroy
    Person.find(params[:id]).destroy
    redirect_to people_url, notice: "Excluído com sucesso!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def procura_cidadao
      @cidadao = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:nome, :data_nascimento, :cpf, :gr, :endereco_logradouro, :endereco_numero, :endereco_bairro, :naturalidade, :nome_progenitor, :nome_progenitora, :etinia, :escolaridade, :obs, :ativo)
    end
end
