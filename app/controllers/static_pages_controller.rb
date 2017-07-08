class StaticPagesController < ApplicationController

  def root
    if params[:query]
      query = params[:query].downcase
      @gem_exist = true;
      begin
        gem_result = Gems.info query
      rescue
        @gem_exist = false;
      end
      puts gem_result
      if @gem_exist
        @gem_name = gem_result['name']
        @gem_info = gem_result['info']
        @gem_uri = gem_result['project_uri']
        # Retrieving the names of dependencies and storing into an array
        gem_dep_keys = gem_result['dependencies']["development"].map do |dep| dep["name"] end
        @gem_dep = {}
        # Getting uri for the dependency names and creating hash with dep name as key, uri as value
        gem_dep_keys.each do |key|
          @gem_dep[key] = ((Gems.info key)['project_uri'])
        end
      end
      respond_to do |format|
        format.js
      end
    end
  end

  def favorites
  end

end
