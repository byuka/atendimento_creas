class ServicesController < ApplicationController
    def index
        @servicos = Service.all
    end

    def new
        @servico = Service.new
    end

    def create
        @servico = Service.new(service_params)

        if @servico.save
            redirect_to @servico, notice: "Cadastrado com sucesso!"
        else 
            render :new
        end
    end

    def show
        @servico = Service.find(params[:id])
    end

    def destroy
        Service.find(params[:id]).destroy
        redirect_to services_url, notice: "Excluído com sucesso!"
    end

    def edit
        @servico = Service.find(params[:id])
    end

    def update
        @servico = Service.find(params[:id])
       
        if @servico.update(service_params)
            redirect_to services_url, notice: "Dados atualizados com sucesso!"
        else
            render :edit
        end
        
    end
    
    private
    def service_params
        params.require(:service).permit(:nome, :descricao, :ativo)
    end
end