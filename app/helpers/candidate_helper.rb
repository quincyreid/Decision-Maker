module CandidateHelper
  def max_vote_count(candidates)
    count = []
    
    candidates.each do |c|
      count << c.votes_count
    end
    
    if count.max == 1 then vote = "vote" else vote = "votes" end
      @winner_points = "Current Winner has: #{count.max} #{vote}"
    end
    
    def total_votes(candidates)
      count = 0
      
      candidates.each do |c|
        count += c.votes_count
      end
      count
    end
  
end
