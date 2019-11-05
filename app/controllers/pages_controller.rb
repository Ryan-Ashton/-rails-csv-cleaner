class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @files_counter = Session.all.length
    @session = Session.new
  end

end
