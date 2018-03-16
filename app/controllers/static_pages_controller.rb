class StaticPagesController < ApplicationController

    def search_person
        termo = params[:pesquisa][:termo] if params.has_key?(:pesquisa)
        if termo
            @cidadaos = Person.where("nome LIKE ? OR cpf LIKE ? OR rg LIKE ?", termo, termo, termo)
        end
    end
end
