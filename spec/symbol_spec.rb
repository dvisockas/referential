RSpec.describe Symbol do
  describe '#>><<' do
    let(:input) do
      [
        ' a, a ',
        ' b, b ',
      ]
    end

    let(:output) { %w[a b] }

    context 'when composing multiple symbols' do
      it 'works as if symbols were procs' do
        expect(input.map(&:strip >> :split >> :last)).to eq(output)
      end

      it 'works with callable and symbol mix' do
        expect(input.map(&:strip >> Proc.new(&:split) >> :last)).to eq(output)
      end
    end
  end
end
