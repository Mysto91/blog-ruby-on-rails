class Api::InfoController < ApplicationController

    def index
        render(json: { "date": Time.now })
    end
end
