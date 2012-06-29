module ApplicationHelper

  def percentage_of_votes(candidate)
            ((((Vote.find_all_by_voteable_id(candidate.id)).length)/(Vote.count.to_f))*100).to_s+'%'
  end


end
