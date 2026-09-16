require "rails_helper"

RSpec.describe "Lists::Contents", type: :request do
  describe "GET /lists/:list_id/contents" do
    let(:list) { create(:list) }
    let!(:movie) { create(:movie) }
    let!(:tv_show) { create(:tv_show) }
    let!(:season) { create(:season, tv_show: tv_show) }
    let!(:episode) { create(:episode, season: season) }

    before do
      create(:list_item, list: list, content: movie, position: 1)
      create(:list_item, list: list, content: tv_show, position: 2)
      create(:list_item, list: list, content: season, position: 3)
      create(:list_item, list: list, content: episode, position: 4)
    end

    it "returns contents in list order with position" do
      get "/lists/#{list.id}/contents"

      expect(response).to have_http_status(:ok)
      ids = response.parsed_body["contents"].pluck("id")
      positions = response.parsed_body["contents"].pluck("position")
      expect(ids).to eq([ movie.id, tv_show.id, season.id, episode.id ])
      expect(positions).to eq([ 1, 2, 3, 4 ])
    end

    it "filters by content_type and preserves order" do
      get "/lists/#{list.id}/contents", params: { content_type: "movie" }

      expect(response).to have_http_status(:ok)
      body = response.parsed_body
      expect(body["contents"].size).to eq(1)
      expect(body["contents"].first["content_type"]).to eq("movie")
      expect(body["contents"].first["position"]).to eq(1)
    end

    it "filters and paginates" do
      list = create(:list)
      3.times { |i| create(:list_item, list: list, content: create(:movie), position: i + 1) }
      create(:list_item, list: list, content: create(:tv_show), position: 4)

      get "/lists/#{list.id}/contents", params: { content_type: "movie", page: 2, limit: 2 }

      expect(response).to have_http_status(:ok)
      body = response.parsed_body
      expect(body["contents"].size).to eq(1)
      expect(body["contents"].first["content_type"]).to eq("movie")
      expect(body["pagy"]["page"]).to eq(2)
    end

    it "treats blank content_type as unfiltered" do
      get "/lists/#{list.id}/contents", params: { content_type: "" }

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["contents"].size).to eq(4)
    end

    it "returns 400 for unknown content_type" do
      get "/lists/#{list.id}/contents", params: { content_type: "podcast" }

      expect(response).to have_http_status(:bad_request)
    end

    it "returns empty contents for page past the end" do
      get "/lists/#{list.id}/contents", params: { page: 99 }

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["contents"]).to eq([])
    end

    it "returns 404 for missing list" do
      get "/lists/0/contents"

      expect(response).to have_http_status(:not_found)
    end
  end
end
