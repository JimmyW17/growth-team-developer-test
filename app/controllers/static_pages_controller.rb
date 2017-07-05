class StaticPagesController < ApplicationController

  def root
    if params[:query]
      query = params[:query].downcase
      puts "Searching for #{query}....................................."
      puts Gems.info query

      
      render :root
    end
  end

  def favorites
  end

end
