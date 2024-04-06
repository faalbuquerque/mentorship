require 'rails_helper'

RSpec.describe "/mentees", type: :request do
  describe "GET /index" do
    it "renders a successful response" do
      get mentees_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      mentee = Mentee.create(name: "test", email: "test@example.com", bio: "mentee test bio")
      get mentee_url(mentee)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_mentee_url
      expect(response).to be_successful
    end
  end
  
  describe "POST /edit" do
    it "renders a successful response" do
      mentee = Mentee.create(name: "test", email: "test@example.com", bio: "mentee test bio")
      get edit_mentee_url(mentee)
      expect(response).to be_successful
    end
  end
  
  describe "POST /create" do
    context "with valid params" do
      it "renders a successful response" do
        attributes = {name: "test", email: "test@example.com", bio: "mentee test bio"}
        
        expect{post mentees_url, params: {mentee: attributes}}.to change(Mentee, :count).by(1)
      end

      it "redirects to the created Mentee" do
        attributes = {name: "test", email: "test@example.com", bio: "mentee test bio"}

        post mentees_url, params: {mentee: attributes}
        
        expect(response).to redirect_to(mentee_url(Mentee.last))
      end
    end

    context "with invalid params" do
      it "renders a non successful response" do
        attributes = {email: "test@example.com", bio: "mentee test bio"}
        post mentees_url, params: {mentee: attributes}
        
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested mentee" do
      mentee = Mentee.create(name: "test", email: "test@example.com", bio: "mentee test bio")

      expect { delete mentee_url(mentee) }.to change(Mentee, :count).by(-1)
    end

    it "redirects to the mentees list" do
      mentee = Mentee.create(name: "test", email: "test@example.com", bio: "mentee test bio")
      delete mentee_url(mentee)
      expect(response).to redirect_to(mentees_url)
    end
  end
end
