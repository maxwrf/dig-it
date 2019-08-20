class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # probs takes first 8 (thought technically not ordered
    # TODO: add 'featured' attr to diggers more manual curation
    @diggers = Digger.take(8)
  end
end
