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
end
