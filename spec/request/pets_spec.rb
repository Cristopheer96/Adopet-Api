require 'rails_helper'
require 'byebug'

RSpec.describe 'Pet ', type: :request do
  describe 'GET api/v1/pets' do # es descriptivo no codea nada

    it 'should return Ok' do #las pruebas en rspec comienznas con it
      get '/api/v1/pets'
      payload = JSON.parse(response.body)
      expect(payload).to be_empty
      expect(response).to have_http_status(200)
    end
    # describe "Search" do
    #   let!(:tuco) { create(:pet, title: 'Hola Mundo') }
    #   let!(:bob) { create(:pet, title: 'Hola Rails') }
    #   let!(:tuco) { create(:pet, title: 'Curso Rails') }

    #   it "should filter posts by title" do
    #     get "/posts?search=Hola"
    #     payload = JSON.parse(response.body)
    #     expect(payload).to_not be_empty
    #     expect(payload.size).to eq(2)
    #     expect(payload.map { |p| p["id"] }.sort).to eq([hola_mundo.id, hola_rails.id].sort)
    #     expect(response).to have_http_status(200)
    #   end
    # end

  end

  describe 'with data in the DB' do
    let!(:pets) {  create_list(:pet, 10 ) } #esto declara una variabla llamda posts y se le asigna lo que esta dentro del bloque. la parte de 'create list' es de factoby bot y 'let(:post) es de RSpec'  Aqui usamos factory bot para generear datos de prueba
    before { get '/api/v1/pets'}

    it 'should return all the published pets' do
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(pets.size)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET api/v1/pets/{id}' do
    let!(:pet) {  create(:pet ) }

    it 'should return a specific pet' do
      get "/api/v1/pets/#{pet.id}"
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload['name']).to eq(pet.name)

      expect(response).to have_http_status(200)
    end
  end
end
