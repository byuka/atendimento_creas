# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Assistance.destroy_all
puts("Zerando tabela de Beneficios")

beneficios = [  "CN - Certidão de Nascimento", 
                "CB - Cesta Básica", 
                "CH - Chinelo", 
                "KH - Kit Higiene", 
                "VF - Vale Foto", 
                "ME - Material Escolar"]

beneficios.each do |beneficio|
    Assistance.create(nome: beneficio)
    puts("Benenficio cadastrado: #{beneficio}")
end

Service.destroy_all
puts("Zerando tabela de Serviços")

servicos = [    "PDC - Pessoa com Deficiência",
                "VVD - Vítmia de Violência Doméstica",
                "VVS - Vítima de Violência Sexual",
                "PSR - Pessoa com Situação de Rua",
                "MSE - Medidas Socioeducativas",
                "PETI - Programa de Erradicação de Trabalho Infantil",
                "PAAD - Programa de Atenção ao Adolecente Drogadito"]

servicos.each do |servico|
    Service.create(nome: servico)
    puts("Serviço cadastrado: #{servico}")
end
