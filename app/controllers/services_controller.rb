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
            redirect_to services_url
        else 
            render :new
        end
    end

    def show
        @servico = Service.find(params[:id])
    end

    def destroy
        Service.find(params[:id]).destroy
        redirect_to services_url
    end


    private
    def service_params
        params.require(:service).permit(:nome, :descricao)
    end
end