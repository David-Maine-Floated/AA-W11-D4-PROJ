class Api::PokemonController < ApplicationController


    def types  
        # debugger
        render json: Pokemon::TYPES
    end

    def index
        @pokemon = Pokemon.all
        render json: @pokemon
        # render index
    end

    def show
        @pokemon = Pokemon.find_by(id: params[id])
        if @pokemon 
            render json: @pokemon
        else  
            render json: 'pokemon not found' status: :not_found
        end
        # render show
    end



end
