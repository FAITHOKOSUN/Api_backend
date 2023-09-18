# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API::V1::Animals', type: :request do
  # Let's assume you have a model named Animal, and you want to test its API endpoints.

  # Create a test animal for use in the tests
  let!(:animal) { create(:animal, name: 'Lion', order: 'Carnivora', family: 'Felidae') }

  describe 'GET /api/v1/animals' do
    it ' list of animals' do
      # Send a GET request to the endpoint
      get '/api/v1/animals'

      # Expect a successful response (HTTP status code 200)
      expect(response).to have_http_status(200)

      # Parse the response JSON
      animals = JSON.parse(response.body)

      # Expect that the response contains an array of animals
      expect(animals).to be_an(Array)

      # Assuming you have a specific JSON format for animal representation,
      # you can check the structure of each animal in the response
      expect(animals[0]).to include('id', 'name', 'order', 'family')
    end
  end

  describe 'POST /api/v1/animals' do
    it 'creates a new animal' do
      # Define the parameters for creating a new animal
      new_animal_params = {
        animal: {
          name: 'Tiger',
          order: 'Carnivora',
          family: 'Felidae'
        }
      }

      # Send a POST request to create a new animal
      post '/api/v1/animals', params: new_animal_params

      # Expect a successful response (HTTP status code 201 - Created)
      expect(response).to have_http_status(201)

      # Parse the response JSON
      created_animal = JSON.parse(response.body)

      # Expect that the response contains the created animal
      expect(created_animal).to include('id', 'name', 'order', 'family')

      # Optionally, you can also check if the animal was created in the database
      expect(Animal.find_by(name: 'Tiger')).to_not be_nil
    end
  end

 # Send a PUT request to update an existing animal
put "/api/v1/animals/#{animal_id}", params: updated_animal_params

# Expect a successful response (HTTP status code 200 - OK)
expect(response).to have_http_status(200)

# Optionally, you can check if the animal was updated in the database
updated_animal = Animal.find(animal_id)
expect(updated_animal.name).to eq(updated_animal_params[:name])

 end
end
# Send a PATCH request to partially update an existing animal
patch "/api/v1/animals/#{animal_id}", params: partial_updated_animal_params

# Expect a successful response (HTTP status code 200 - OK)
expect(response).to have_http_status(200)

# Optionally, you can check if the animal was partially updated in the database
updated_animal = Animal.find(animal_id)
expect(updated_animal.name).to eq(partial_updated_animal_params[:name])
 end
end

# Send a DELETE request to remove an existing animal
delete "/api/v1/animals/#{animal_id}"

# Expect a successful response (HTTP status code 204 - No Content)
expect(response).to have_http_status(204)

# Optionally, you can check if the animal was deleted from the database
expect(Animal.find_by(id: animal_id)).to be_nil

end
 end
