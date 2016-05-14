module DParse
  module DSL
    def alt(*ps)
      DParse::Parsers::Alt.new(*ps)
    end

    def char(c)
      DParse::Parsers::Char.new(c)
    end

    def char_in(cs)
      DParse::Parsers::CharIn.new(cs)
    end

    def char_not(c)
      DParse::Parsers::CharNot.new(c)
    end

    def char_not_in(cs)
      DParse::Parsers::CharNotIn.new(cs)
    end

    def end_of_input
      DParse::Parsers::EndOfInput.new
    end

    def intersperse(a, b)
      DParse::Parsers::Intersperse.new(a, b)
    end

    def lazy(&block)
      DParse::Parsers::Lazy.new(&block)
    end

    def opt(p)
      DParse::Parsers::Optional.new(p)
    end

    def repeat(p)
      DParse::Parsers::Repeat.new(p)
    end

    def seq(*ps)
      DParse::Parsers::Seq.new(*ps)
    end

    def string(s)
      DParse::Parsers::String.new(s)
    end

    def whitespace_char
      DParse::Parsers::WhitespaceChar.new
    end
  end
end
