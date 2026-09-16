module Lists
  class ContentsController < ApplicationController
    CONTENT_TYPES = {
      "movie" => "Movie",
      "tv_show" => "TvShow",
      "season" => "Season",
      "episode" => "Episode"
    }.freeze

    def index
      list = List.find(params[:list_id])
      scope = list.list_items.includes(:content)

      if params[:content_type].present?
        type = CONTENT_TYPES[params[:content_type]]
        return render json: { error: "Invalid content_type" }, status: :bad_request unless type

        scope = scope.eager_load(:content).where(contents: { type: type })
      end

      pagy, items = pagy(:offset, scope)
      render json: {
        contents: items.map { |item| item.content.to_api.merge(position: item.position) },
        pagy: pagy.data_hash
      }
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Not found" }, status: :not_found
    end
  end
end
