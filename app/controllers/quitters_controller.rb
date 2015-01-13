class QuittersController < ApplicationController
  include QuittersHelper
  
  
  def new
    @quitter = Quitter.new
  end
  
  def show
       
    @quitter = Quitter.find(params[:id])
  
    #doing all the date stuff here, methods in app helper
    start = Date.parse(@quitter.start_date)
    time = Time.new
    now = Date.parse(time.to_s)
    @how_long =now.mjd - start.mjd
    
    #math to find out costs and stuff 
    per_week = @quitter.times_per_week.to_f
    cost_per = @quitter.cost_per_pack.to_f
    packs_since_start = ((@how_long.to_f / 7) * per_week).to_f
    @how_much = (packs_since_start * cost_per).round(2)
  
    #flash message on screen for intervals
    if @how_long % 7 == 0 
      flash.now[:update] = send_message_to_prof(@how_long)
    end 
  
  end 
  
  def create 
    
    @quitter = Quitter.new(quitter_params)
    
    if @quitter.save
      flash[:success] = "Here are your results!"
      redirect_to @quitter
    else
      render 'new'
    end 
  
  end 
  
      private 
    
      def quitter_params
        params.require(:quitter).permit(:name, :start_date, :cost_per_pack, 
                                     :times_per_week, :user_name)
      end  
end
