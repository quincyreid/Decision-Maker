class Candidate < ActiveRecord::Base
  attr_accessible :name, :vote, :vote_for
  
  acts_as_voteable

  validates :name,
            :presence => true
end
