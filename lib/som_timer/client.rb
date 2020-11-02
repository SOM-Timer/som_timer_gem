module SomTimer

  class Client

    def initialize(access_token = nil)
      @access_token = access_token || ENV["SOM_TIMER_ACCESS_TOKEN"]
    end

  end

end
