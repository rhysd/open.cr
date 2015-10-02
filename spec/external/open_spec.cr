require "../spec_helper"

describe External do

  describe "opener" do
    it "returns command string for Darwin" do
      External.opener(nil, :darwin).should eq "open"
      External.opener("foo", :darwin).should eq "open -a 'foo'"
    end

    it "returns command string for Windows" do
      External.opener(nil, :windows).should eq "start ''"
      External.opener("foo", :windows).should eq "start '' 'foo'"
    end

    it "returns command string for Other platform" do
      External.opener(nil, :linux).should match /xdg-open$/
      External.opener("foo", :linux).should eq "foo"
    end

    it "returns proper command string for current platform" do
      ifdef darwin
        External.opener.should eq External.opener(nil, :darwin)
      elsif windows
        External.opener.should eq External.opener(nil, :windows)
      else
        External.opener.should eq External.opener(nil, :linux)
      end
    end
  end

  describe "open" do
    External.open("http://crystal-lang.org/")
    External.open("#{__DIR__}/../../README.md")
  end
end
