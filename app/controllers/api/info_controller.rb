class Api::InfoController < ApplicationController

    def index
        GiveCurrentDateJob.perform_in(5)
        render(json: { "date": Time.now })
    end
end
