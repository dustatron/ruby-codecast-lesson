class PagesController < ApplicationController
    def home
        @basic_Plan = Plan.find(1)
        @pro_Plan = Plan.find(2)
    end
    
    def about
    end
    
    def contact
    end
    
    
end
