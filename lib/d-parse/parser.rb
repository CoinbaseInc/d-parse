module DParse
  class Parser
    def read(_input, _pos)
      raise NotImplementedError
    end

    def map(&block)
      DParse::Parsers::Mapped.new(self, &block)
    end

    def inspect
      raise NotImplementedError
    end

    def to_s
      inspect
    end
  end
end
