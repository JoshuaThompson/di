defmodule Di.Model.VoteInfo do 
  alias Di.Model.WhoVoted

  defstruct up: nil,
            down: nil,
            who_upvoted: %WhoVoted{},
            who_downvoted: %WhoVoted{}

end
