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
  
        
        get '/cats'
  
        cat = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(cat.length).to eq 1
      end
    end
  
    describe "POST /create" do
      it "creates a cat" do
        cat_params = {
          cat: {
            name: 'Buster',
            age: 4,
            enjoys: 'Meow Mix, and plenty of sunshine.',
            image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
          }
        }
    
        
        post '/cats', params: cat_params
        expect(response).to have_http_status(200)
        cat = Cat.first
        expect(cat.name).to eq 'Buster'
      end
    









      it "doesn't create a cat without a name" do
        cat_params = {
          cat: {
            age: 2,
            enjoys: 'Walks in the park',
            image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
          }
        }
    
        post '/cats', params: cat_params
        expect(response.status).to eq 422
        json = JSON.parse(response.body)
        expect(json['name']).to include "can't be blank"
      end

      it "doesn't create a cat without a age" do
        cat_params = {
          cat: {
            name: 'Felix',
            
            enjoys: 'Walks in the park',
            image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
          }
        }
    
        post '/cats', params: cat_params
        expect(response.status).to eq 422
        json = JSON.parse(response.body)
        expect(json['age']).to include "can't be blank"

    end

    it "doesn't create a cat without enjoys" do
      cat_params = {
        cat: {
          name: 'Felix',
          age: 2,
          
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
  
      post '/cats', params: cat_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['enjoys']).to include "can't be blank"

    end  
    
    it "doesn't create a cat without an image" do
      cat_params = {
        cat: {
          name: 'Felix',
          age: 2,
          enjoys: 'Walks in the park',
          
        }
      }
  
      post '/cats', params: cat_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['image']).to include "can't be blank"

    end  
  end
    
    
    
    describe "PATCH /update" do
      it "updates a cat" do
        Cat.create(
          name: 'Felix',
          age: 2,
          enjoys: 'Walks in the park',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        )
        cat_params = {
          cat: {
          name: 'Buster',
          age: 4,
          enjoys: 'Meow Mix, and plenty of sunshine.',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
      cat = Cat.last 
      patch "/cats/#{cat.id}", params: cat_params 
      expect(response).to have_http_status(200)
      cat=Cat.last
      expect(cat.name).to eq("Buster")
      end
    end
  end
  
