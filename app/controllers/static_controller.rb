class StaticController < ApplicationController
  def home
  end

  def about
  end

  def moreCats
    @moreCatString = ""
    @cats = CatAPI.new.get_images(results_per_page: 5)
    @cats.each do |cat|
      @moreCatString+="<img src="+cat.url+">"
    end
    return @moreCatString.html_safe
  end

  def cats
    @cats = CatAPI.new.get_images(results_per_page: params[:number_of_cats] || 3)
  end

end
