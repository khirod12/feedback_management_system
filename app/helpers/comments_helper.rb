module CommentsHelper
	def voted?(feedback_id,user_id)
    comm=Comment.all
      if(comm!=nil)
        comm.each do |c|
          if(c.feedback_id==feedback_id && c.user_id==user_id && c.vote_count!=nil)
            return true
          end
        end
        return false
      end
    end
end
