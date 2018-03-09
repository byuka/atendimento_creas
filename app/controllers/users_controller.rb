class UsersController < ApplicationController

    def index
        @usuarios = User.all
    end

    def new
        @usuario = User.new
    end

    def create
        @usuario = User.new(user_params)

        if @usuario.save
            redirect_to @usuario, notice: "Cadastrado com sucesso!"
        else 
            render :new
        end
    end


    private

    def user_params
        params.require(:user).permit(:nome, :cpf, :rg, :email, :password, :permissao)
    end
    
end
