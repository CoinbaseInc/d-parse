describe DParse::Parsers::EOF do
  let(:parser) { described_class.new }

  example { expect(parser).to parse('') }

  example { expect(parser).not_to parse('a').and_fail_at(0).line(0).column(0).with_failure('expected end of input, but found \'a\'') }
  example { expect(parser).not_to parse("\n").and_fail_at(0).line(0).column(0).with_failure('expected end of input, but found \'\n\'') }
  example { expect(parser).not_to parse('aa').and_fail_at(0).line(0).column(0).with_failure('expected end of input, but found \'a\'') }
end
