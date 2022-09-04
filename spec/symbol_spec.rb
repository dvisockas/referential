RSpec.describe Symbol do
  describe '#>><<' do
    let(:input) do
      [
        ' a, a ',
        ' b, b ',
      ]
    end

    let(:output) { %w[a b] }

    xcontext 'when composing multiple symbols' do
      it 'works with callable and symbol mix' do
        expect(input.map(&:strip).map(&Proc.new(&:split) >> :last)).to eq(output)
      end
    end
  end
end
