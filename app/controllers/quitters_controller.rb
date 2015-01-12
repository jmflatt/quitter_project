class QuittersController < ApplicationController
  
  def new
    @quitter = Quitter.new
  end
  
  def show
    @quitter = Quitter.find(params[:id])
    
    start = Date.parse(@quitter.start_date)
    time = Time.new
    now = Date.parse(time.to_s)
    @how_long =now.mjd - start.mjd
    per_week = @quitter.times_per_week.to_f
    
    cost_per = @quitter.cost_per_pack.to_f
    packs_since_start = ((@how_long.to_f / 7) * per_week).to_f
    @how_much = (packs_since_start * cost_per).round(2)
   #stuff to crunch numbers for the results for the user

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
