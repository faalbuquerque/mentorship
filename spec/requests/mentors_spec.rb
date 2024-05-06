require 'rails_helper'

RSpec.describe "Mentors", type: :request do
  describe "GET /index" do
    it "returns a 200" do
      get mentors_path
      expect(response).to have_http_status(:ok)
    end

    it "renders a mentor" do
      Mentor.create!(name: "Lorena", email: "lorena@email.com")
      get mentors_path
      expect(Mentor.all.last.name).to eq("Lorena")
      expect(response.body).to include("Lorena")
    end

    it "renders message when there are no mentors" do
      get mentors_path
      expect(response.body).to include("Não temos mentores cadastrados!")
    end
  end

  describe "GET /new" do
    it "returns a 200 status" do
      get new_mentor_path
      expect(response).to have_http_status(:ok)
    end

    it "renders the new mentor template" do
      get new_mentor_path
      expect(response).to render_template('new')
    end
  end

  describe "POST /create" do
    it "creates a new mentor" do
      expect {
        post mentors_path, params: { mentor: { name: "John Doe", email: "john@example.com", url: "http://example.com", bio: "Bio example" } }
      }.to change(Mentor, :count).by(1)
    end

    it "redirects to the mentor show page" do
      post mentors_path, params: { mentor: { name: "John Doe", email: "john@example.com", url: "http://example.com", bio: "Bio example" } }
      mentor = Mentor.last
      expect(response).to redirect_to(mentor_path(mentor))
    end
  end
end
