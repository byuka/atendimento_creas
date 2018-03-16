class ServicesController < ApplicationController
    before_action :procura_servico, only: [:show, :edit, :update]
    # before_action :procura_servico, except: [:index]


    def index
        @servicos = Service.all
        authorize @servicos
    end

    def new
        @servico = Service.new
        authorize @servico
    end

    def create
        @servico = Service.new(service_params)
        authorize @servico

        if @servico.save
            redirect_to @servico, notice: "Cadastrado com sucesso!"
        else 
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update       
        if @servico.update(service_params)
            redirect_to services_url, notice: "Dados atualizados com sucesso!"
        else
            render :edit
        end        
    end
    
    private
    def procura_servico
        @servico = Service.find(params[:id])
        authorize @servico
    end

    def service_params
        params.require(:service).permit(:nome, :descricao, :ativo)
    end
end