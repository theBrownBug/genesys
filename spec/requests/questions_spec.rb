# frozen_string_literal: true

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

RSpec.describe '/questions', type: :request do
  # Question. As you add validations to Question, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Question.create! valid_attributes
      get questions_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      question = Question.create! valid_attributes
      get question_url(question)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_question_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      question = Question.create! valid_attributes
      get edit_question_url(question)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Question' do
        expect do
          post questions_url, params: { question: valid_attributes }
        end.to change(Question, :count).by(1)
      end

      it 'redirects to the created question' do
        post questions_url, params: { question: valid_attributes }
        expect(response).to redirect_to(question_url(Question.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Question' do
        expect do
          post questions_url, params: { question: invalid_attributes }
        end.to change(Question, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post questions_url, params: { question: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested question' do
        question = Question.create! valid_attributes
        patch question_url(question), params: { question: new_attributes }
        question.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the question' do
        question = Question.create! valid_attributes
        patch question_url(question), params: { question: new_attributes }
        question.reload
        expect(response).to redirect_to(question_url(question))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        question = Question.create! valid_attributes
        patch question_url(question), params: { question: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested question' do
      question = Question.create! valid_attributes
      expect do
        delete question_url(question)
      end.to change(Question, :count).by(-1)
    end

    it 'redirects to the questions list' do
      question = Question.create! valid_attributes
      delete question_url(question)
      expect(response).to redirect_to(questions_url)
    end
  end
end
