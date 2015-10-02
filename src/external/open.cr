# Module to deal with external stuffs in Crystal
module External

  # :nodoc:
  private def self.opener_darwin(app)
    if app
      "open -a '#{app}'"
    else
      "open"
    end
  end

  # :nodoc:
  private def self.opener_windows(app)
    if app
      "start '' '#{app}'"
    else
      "start ''"
    end
  end

  # :nodoc:
  private def self.opener_others(app)
    if app
      app
    else
      "#{__DIR__}/../../vendor/xdg-open"
    end
  end

  # Returns the command string to open something externally.
  #
  # ```
  #   External::opener
  #   External::opener("Google Chrome")
  #   External::opener("Google Chrome", :darwin)
  #   External::opener("Google Chrome", :windows)
  #   External::opener("Google Chrome", :linux)
  # ```
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

  # Opens something externally in manner of your OS.
  # In OS X, it uses 'open' command.
  # In Windows, it uses 'start' command.
  # In Linux or other *nix OS, it uses 'xdg-open' command included in this repository.
  #
  # ```
  #   External::open "http://crystal-lang.org/"
  #   External::open "file:///Users/foo/Documents/somedoc.pdf"
  #   External::open "../../README.md"
  #   External::open "musics/bar.mp3"
  # ```
  def self.open(something: String, app = nil, platform = nil)
    system("#{opener(app, platform)} '#{something}'")
  end
end
