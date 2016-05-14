describe DParse::Failure do
  let(:failure) { described_class.new("one\ntwo\nthree\nfour\nfive", position, message: message) }

  let(:position) { DParse::Position.new(index: 13, line: 2, column: 3) }
  let(:message) { 'argh' }

  describe '#full_message' do
    subject { failure.full_message }
    it { is_expected.to eql('argh at line 3, column 4') }
  end

  describe '#pretty_message' do
    subject { failure.pretty_message }
    it { is_expected.to eql("\e[34m[D*Parse]\e[0m argh at line 3, column 4\n\e[34m[D*Parse]\e[0m \n\e[34m[D*Parse]\e[0m thr\e[31me\e[0me\n\e[34m[D*Parse]\e[0m \e[31m   ↑\e[0m\n") }
  end
end
