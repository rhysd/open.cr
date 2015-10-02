module External
  private def self.opener_darwin(app)
    if app
      "open -a '#{app}'"
    else
      "open"
    end
  end

  private def self.opener_windows(app)
    if app
      "start '' '#{app}'"
    else
      "start ''"
    end
  end

  private def self.opener_others(app)
    if app
      app
    else
      "#{__DIR__}/../../vendor/xdg-open"
    end
  end

  def self.opener(app = nil, platform = nil)
    if platform
      return case platform
      when :darwin
        opener_darwin app
      when :windows
        opener_windows app
      else
        opener_others app
      end
    end

    ifdef darwin
      opener_darwin app
    elsif windows
      opener_windows app
    else
      opener_others app
    end
  end

  def self.open(uri: String, app = nil, platform = nil)
    system("#{opener(app, platform)} '#{uri}'")
  end
end
