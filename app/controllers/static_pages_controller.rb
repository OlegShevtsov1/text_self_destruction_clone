class StaticPagesController < ApplicationController
  include ActionView::Layouts

  def show
    render file: 'public/docs/v1.html'
  end
end
