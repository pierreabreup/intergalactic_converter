RSpec.describe 'IntergalacticConversionService' do |variable|
  describe 'When expression are valids' do
    context 'and find how many credit is it' do
      it '​pish tegj glob glob is 42' do
        credits = IntergalacticConversionService.new('pish tegj glob glob').credits
        expect(credits).to eq(42)
      end

      it 'glob prok is IV' do
        credits = IntergalacticConversionService.new('glob prok Iron').credits
        expect(credits).to eq(782)
      end
    end
  end

  describe 'When expression are invalids' do
    context 'and there is invalid term' do
      it 'glob prok Wood raise ConversionFailureError exception' do
        expect { IntergalacticConversionService.new('glob prok Wood').credits }.to raise_error(ConversionFailureError)
      end
    end
  end
end

