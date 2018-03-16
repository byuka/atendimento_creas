class UsersController < ApplicationController
    before_action :procura_usuario, only: [:show, :edit, :update]

    def index
        @usuarios = User.all
        authorize @usuarios
    end

    def new
        @usuario = User.new
        authorize @usuario
    end

    def create
        @usuario = User.new(user_params)
        authorize @usuario

        if @usuario.save
            redirect_to @usuario, notice: "Cadastrado com sucesso!"
        else 
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update 
        if @usuario.update(user_params)
            redirect_to users_url, notice: "Dados atualizados com sucesso!"
        else
            render :edit
        end    
    end
    
    private
    def procura_usuario
        @usuario = User.find(params[:id])
        authorize @usuario
    end

    def user_params
        params.require(:user).permit(:nome, :cpf, :rg, :email, :password, :permissao, :ativo)
    end
    
end
