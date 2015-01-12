module ApplicationHelper
    def full_title(page_title='')
        base_title = 'Ruby on Rails Tutorial Sample App'
        if page_title.empty? 
            base_title
        else
            "#{page_title} | #{base_title}"
        end
    end
    
  def hourly(time)
    i = time
    x = 0 
      until i < 60 do 
        x = x + 1
        i = i - 60
      end
    return x.to_s + ' hours and ' + i.to_s
  end 
  
  def to_long_date(date)
    updated_date = Date.parse(date)
    updated_date.to_formatted_s(:long_ordinal)
  end 
  
  # def how_long_and_how_much?(start_date, times_per_week, cost_per_pack)

  # end  
  
  # def money_saved_since(start_date, times_per_week, cost_per_pack)
  #   weeks_since_start = ((how_long?(start_date)) / 7)
    
  #   per_week = times_per_week.to_f
    
  #   cost_per = cost_per_pack.to_f
 
  #   packs_since_start = (weeks_since_start * per_week).to_f
  #   return (packs_since_start * cost_per).round(2)
  # end
    # smoke = 4
    # @saved_amount = ((@how_long.to_f / 7 ) * smoke.to_f) * 6.10
    # @amount_avoided = ((@how_long.to_f / 7 ) * smoke.to_f) * 20
    # @time_regained = (@amount_avoided * 5.00).round(0)
end
