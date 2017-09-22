module FeedbacksHelper
	def count_vote(fid)
		all_comm=Comment.all
		count=0
		all_comm.each do |c|
			if(c.feedback_id == fid)
				count=count+1 unless c.vote_count.nil?
			end
		end
		puts count
		count
	end
## Write all the bean getter and setter methods
	def customer_name(uid)
		if User.find_by_id(uid).customer_name.nil?
			return "NA"
		else
			User.find_by_id(uid).customer_name
		end
	end

## admin can only have some pecial previleges
	def admin?(uid)
		type=User.find_by_id(uid).user_type
		if type!=nil && type.downcase == 'admin'
			return true
		else
			return false
		end
	end

	def mail_url(f)
		"mailto:#{f.email}?Subject=Re:#{f.feedback_title}&Body=#{f.feedback_desc}"
	end

end
