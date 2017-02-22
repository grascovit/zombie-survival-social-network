require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:item)
  }

  let(:invalid_attributes) {
    attributes_for(:invalid_item)
  }

  describe 'GET #index' do
    it 'assigns all items as @items' do
      item = Item.create! valid_attributes
      get :index, params: { user_id: valid_attributes[:user_id] }
      expect(assigns(:items)).to eq([item])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested item as @item' do
      item = Item.create! valid_attributes
      get :show, params: { id: item.to_param }
      expect(assigns(:item)).to eq(item)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Item' do
        expect {
          post :create, params: { item: valid_attributes, user_id: valid_attributes[:user_id] }
        }.to change(Item, :count).by(1)
      end

      it 'assigns a newly created item as @item' do
        post :create, params: { item: valid_attributes, user_id: valid_attributes[:user_id] }
        expect(assigns(:item)).to be_a(Item)
        expect(assigns(:item)).to be_persisted
      end

      it 'redirects to the created item' do
        post :create, params: { item: valid_attributes, user_id: valid_attributes[:user_id] }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved item as @item' do
        post :create, params: { item: invalid_attributes, user_id: valid_attributes[:user_id] }
        expect(assigns(:item)).to be_a_new(Item)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        attributes_for(:item)
      }

      it 'updates the requested item' do
        item = Item.create! valid_attributes
        put :update, params: { id: item.to_param, item: new_attributes, user_id: valid_attributes[:user_id] }
        item.reload
        expect(item.name).to eq(new_attributes[:name])
      end

      it 'assigns the requested item as @item' do
        item = Item.create! valid_attributes
        put :update, params: { id: item.to_param, item: valid_attributes, user_id: valid_attributes[:user_id] }
        expect(assigns(:item)).to eq(item)
      end

      it 'redirects to the item' do
        item = Item.create! valid_attributes
        put :update, params: { id: item.to_param, item: valid_attributes, user_id: valid_attributes[:user_id] }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      it 'assigns the item as @item' do
        item = Item.create! valid_attributes
        put :update, params: { id: item.to_param, item: invalid_attributes, user_id: valid_attributes[:user_id] }
        expect(assigns(:item)).to eq(item)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested item' do
      item = Item.create! valid_attributes
      expect {
        delete :destroy, params: { id: item.to_param, user_id: valid_attributes[:user_id] }
      }.to change(Item, :count).by(-1)
    end

    it 'redirects to the items list' do
      item = Item.create! valid_attributes
      delete :destroy, params: { id: item.to_param, user_id: valid_attributes[:user_id] }
      expect(response).to have_http_status(:no_content)
    end
  end
end
