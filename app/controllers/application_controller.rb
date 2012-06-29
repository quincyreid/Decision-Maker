class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected 
  
  def voter_rights
    unless current_admin or current_voter
          redirect_to :action => :index, :notice => "You must be signed in to do that!"
    end
  end
  
  def keys_to_kingdom
    unless current_admin
          redirect_to :action => :index, :notice => "Sorry you must be admin to do that!"
    end
  end
    
end
