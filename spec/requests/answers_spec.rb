require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/answers', type: :request do
  # Answer. As you add validations to Answer, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Answer.create! valid_attributes
      get answers_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      answer = Answer.create! valid_attributes
      get answer_url(answer)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_answer_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      answer = Answer.create! valid_attributes
      get edit_answer_url(answer)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Answer' do
        expect do
          post answers_url, params: { answer: valid_attributes }
        end.to change(Answer, :count).by(1)
      end

      it 'redirects to the created answer' do
        post answers_url, params: { answer: valid_attributes }
        expect(response).to redirect_to(answer_url(Answer.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Answer' do
        expect do
          post answers_url, params: { answer: invalid_attributes }
        end.to change(Answer, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post answers_url, params: { answer: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested answer' do
        answer = Answer.create! valid_attributes
        patch answer_url(answer), params: { answer: new_attributes }
        answer.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the answer' do
        answer = Answer.create! valid_attributes
        patch answer_url(answer), params: { answer: new_attributes }
        answer.reload
        expect(response).to redirect_to(answer_url(answer))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        answer = Answer.create! valid_attributes
        patch answer_url(answer), params: { answer: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested answer' do
      answer = Answer.create! valid_attributes
      expect do
        delete answer_url(answer)
      end.to change(Answer, :count).by(-1)
    end

    it 'redirects to the answers list' do
      answer = Answer.create! valid_attributes
      delete answer_url(answer)
      expect(response).to redirect_to(answers_url)
    end
  end
end
