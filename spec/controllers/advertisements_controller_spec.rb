require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do

  let(:my_advertisement) { Advertisement.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(10..40))}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_advertisement] to @advertisements" do
      get :index

      expect(assigns(:advertisements)).to eq([my_advertisement])
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, {id: my_advertisement.id}
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show, {id: my_advertisement.id}
      expect(response).to render_template :show
    end

    it "assigns my_advertisement to @advertisement" do
      get :show, {id: my_advertisement.id}
      expect(assigns(:advertisement)).to eq(my_advertisement)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "Advertisement create" do
    it "increases the number of Advertisement by 1" do
      expect{post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 5}}.to change(Advertisement,:count).by(1)
    end

    it "assigns the new post to @advertisement" do
      post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(5..40)}
      expect(assigns(:advertisement)).to eq Advertisement.last
    end

    it "redirects to the new advertisement" do
      post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(5..40)}
      expect(response).to redirect_to Advertisement.last
    end
  end

end
