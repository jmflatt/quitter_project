module QuittersHelper
  def send_message_to_prof(how_long)
    days = how_long.to_f 
    flash_messages = '' 
    messages_hash = {1 => 'its been a week, keep it up',
                     2 => '2 weeks!',
                     3 => 'almost a month!',
                     4 => 'a month! treat yoself!'
                    }

    messages_hash.each do |k,v| 
      if k == days / 7.0 
        flash_messages = messages_hash[k] 
      else 
        ''
      end
    end
    flash_messages 
  end 
end
