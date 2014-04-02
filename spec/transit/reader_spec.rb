require 'spec_helper'

module Transit
  describe Reader do
    let(:reader) { Reader.new(:json) }

    it "parses a top-level scalar" do
      io = StringIO.new('{"~#\'":37}', 'r+')
      assert { reader.read(io) == 37 }
    end

    it "parses a top-level map" do
      io = StringIO.new('{"foo":37}', 'r+')
      assert { reader.read(io) == {"foo" => 37 } }
    end

    it "parses an array" do
      io = StringIO.new('[1]', 'r+')
      assert { reader.read(io) == [1] }
    end

    it "parses an array (with a block)" do
      io = StringIO.new('[1]', 'r+')
      received = nil
      reader.read(io) {|o| received = o}
      assert { received == [1] }
    end
  end
end
