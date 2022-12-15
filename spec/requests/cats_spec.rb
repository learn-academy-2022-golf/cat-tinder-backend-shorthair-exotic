require 'rails_helper'

  RSpec.describe "Cats", type: :request do
    describe "GET /index" do
      it "gets a list of cats" do
        Cat.create(
          name: 'Felix',
          age: 2,
          enjoys: 'Walks in the park',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        )
  
        # Make a request
        get '/cats'
  
        cat = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(cat.length).to eq 1
      end
    end
  end
