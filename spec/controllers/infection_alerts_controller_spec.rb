require 'rails_helper'

RSpec.describe InfectionAlertsController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:infection_alert)
  }

  let(:invalid_attributes) {
    attributes_for(:invalid_infection_alert)
  }

  describe 'GET #index' do
    it 'assigns all infection_alerts as @infection_alerts' do
      infection_alert = InfectionAlert.create! valid_attributes
      get :index, params: {}
      expect(assigns(:infection_alerts)).to eq([infection_alert])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested infection_alert as @infection_alert' do
      infection_alert = InfectionAlert.create! valid_attributes
      get :show, params: { id: infection_alert.to_param }
      expect(assigns(:infection_alert)).to eq(infection_alert)
    end
  end

  describe 'GET #received_infection_alerts' do
    it 'assigns only infection_alerts where infected_user_id is :user_id' do
      infection_alert = InfectionAlert.create! valid_attributes
      get :received_infection_alerts, params: { user_id: infection_alert.infected_user_id }
      expect(assigns(:infection_alerts)).to eq([infection_alert])
    end
  end

  describe 'GET #reported_infection_alerts' do
    it 'assigns only infection_alerts where reporter_user_id is :user_id' do
      infection_alert = InfectionAlert.create! valid_attributes
      get :reported_infection_alerts, params: { user_id: infection_alert.reporter_user_id }
      expect(assigns(:infection_alerts)).to eq([infection_alert])
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new InfectionAlert' do
        expect {
          post :create, params: { infection_alert: valid_attributes }
        }.to change(InfectionAlert, :count).by(1)
      end

      it 'assigns a newly created infection_alert as @infection_alert' do
        post :create, params: { infection_alert: valid_attributes }
        expect(assigns(:infection_alert)).to be_a(InfectionAlert)
        expect(assigns(:infection_alert)).to be_persisted
      end

      it 'redirects to the created infection_alert' do
        post :create, params: { infection_alert: valid_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved infection_alert as @infection_alert' do
        post :create, params: { infection_alert: invalid_attributes }
        expect(assigns(:infection_alert)).to be_a_new(InfectionAlert)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        attributes_for(:infection_alert)
      }

      it 'updates the requested infection_alert' do
        infection_alert = InfectionAlert.create! valid_attributes
        put :update, params: { id: infection_alert.to_param, infection_alert: new_attributes }
        infection_alert.reload
        expect(infection_alert.infected_user_id).to eq(new_attributes[:infected_user_id])
      end

      it 'assigns the requested infection_alert as @infection_alert' do
        infection_alert = InfectionAlert.create! valid_attributes
        put :update, params: { id: infection_alert.to_param, infection_alert: valid_attributes }
        expect(assigns(:infection_alert)).to eq(infection_alert)
      end

      it 'redirects to the infection_alert' do
        infection_alert = InfectionAlert.create! valid_attributes
        put :update, params: { id: infection_alert.to_param, infection_alert: valid_attributes }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      it 'assigns the infection_alert as @infection_alert' do
        infection_alert = InfectionAlert.create! valid_attributes
        put :update, params: { id: infection_alert.to_param, infection_alert: invalid_attributes }
        expect(assigns(:infection_alert)).to eq(infection_alert)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested infection_alert' do
      infection_alert = InfectionAlert.create! valid_attributes
      expect {
        delete :destroy, params: { id: infection_alert.to_param }
      }.to change(InfectionAlert, :count).by(-1)
    end

    it 'redirects to the infection_alerts list' do
      infection_alert = InfectionAlert.create! valid_attributes
      delete :destroy, params: { id: infection_alert.to_param }
      expect(response).to have_http_status(:no_content)
    end
  end
end
