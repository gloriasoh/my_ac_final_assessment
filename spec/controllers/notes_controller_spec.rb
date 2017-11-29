require 'rails_helper'

RSpec.describe NotesController, type: :controller do

  let(:user) {create(:user)}
  before { sign_in user}

  describe 'GET #index' do
    let!(:note) {create(:note, user: user)}
    let!(:user2) {create(:user)}

    before {get :index}

    it { expect(assigns(:notes).count).to eq(1) }
    it { expect(assigns(:user)).to contain_exactly(user2)}
  end

  describe 'POST #create' do

    before {get :create, params: {note: note_params}}

    context 'if save is successful' do

    let(:note_params) {attributes_for(:note)}
    it { expect(Note.count).to eq(1) }
    it { is_expected.to redirect_to(root_path)}

    end

    context 'if save is unsuccessful' do
      let(:note_params) {attributes_for(:note, body: '')}
      it {is_expected.to render_template(:new)}
    end

  end

  describe 'GET #new' do

    before {get :new}
    it { expect(assigns(:note)).to be_a_new(Note)}

  end

  describe 'PUT #update' do

    let!(:note) {create(:note, user:user)}

    before do
      put :update, params: {
        user_id: user,
        id: note,
        note: note_attributes
      }
    end

    context 'when update is successful' do

      let(:note_attributes) {attributes_for(:note)}

      it {expect(subject).to redirect_to(root_path(note.user, assigns(:note)))}

    end

    context 'when update is unsuccessful' do

      let(:note_attributes) {attributes_for(:note, body: '')}
      it {expect(subject).to render_template(:edit)}

    end
    
  end

    describe 'DELETE #destroy' do

      let!(:note) {create(:note, user:user)}

      before do
        delete :destroy, params: {
          user_id: user,
          id: note
        }
      end

      it { expect(assigns(:note)).to be_destroyed }
      it { expect(subject).to redirect_to(root_path) }

  end


end
