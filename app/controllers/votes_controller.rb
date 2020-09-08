class VotesController < ApplicationController
    #this blocks 422 error. Necessary because Rails app generated without -api flag
    skip_before_action :verify_authenticity_token
    
    # def create 
    # end
end
