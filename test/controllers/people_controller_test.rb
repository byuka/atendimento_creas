require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get people_url
    assert_response :success
  end

  test "should get new" do
    get new_person_url
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post people_url, params: { person: { ativo: @person.ativo, cpf: @person.cpf, data_nascimento: @person.data_nascimento, endereco_bairro: @person.endereco_bairro, endereco_logradouro: @person.endereco_logradouro, endereco_numero: @person.endereco_numero, escolaridade: @person.escolaridade, etinia: @person.etinia, gr: @person.gr, naturalidade: @person.naturalidade, nome: @person.nome, nome_progenitor: @person.nome_progenitor, nome_progenitora: @person.nome_progenitora, obs: @person.obs } }
    end

    assert_redirected_to person_url(Person.last)
  end

  test "should show person" do
    get person_url(@person)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_url(@person)
    assert_response :success
  end

  test "should update person" do
    patch person_url(@person), params: { person: { ativo: @person.ativo, cpf: @person.cpf, data_nascimento: @person.data_nascimento, endereco_bairro: @person.endereco_bairro, endereco_logradouro: @person.endereco_logradouro, endereco_numero: @person.endereco_numero, escolaridade: @person.escolaridade, etinia: @person.etinia, gr: @person.gr, naturalidade: @person.naturalidade, nome: @person.nome, nome_progenitor: @person.nome_progenitor, nome_progenitora: @person.nome_progenitora, obs: @person.obs } }
    assert_redirected_to person_url(@person)
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete person_url(@person)
    end

    assert_redirected_to people_url
  end
end
