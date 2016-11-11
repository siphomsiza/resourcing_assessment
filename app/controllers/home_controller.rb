class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  def index
    @notes = Note.where(private: false)
  end
end
