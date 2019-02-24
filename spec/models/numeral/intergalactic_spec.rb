RSpec.describe 'Numeral::Intergalactic' do |variable|
  describe 'When numbers are valids' do
    context 'and convert to roman number' do
      it 'pish tegj glob glob is XLII' do
        roman = Numeral::Intergalactic.new('pish tegj glob glob').to_roman
        expect(roman).to eq('XLII')
      end

      it 'glob prok is IV' do
        roman = Numeral::Intergalactic.new('glob prok').to_roman
        expect(roman).to eq('IV')
      end
    end
  end

  describe 'When numbers are invalids' do
    context 'and there is invalid terms' do
      it 'pish tegj oba return error message' do
        intergalactic = Numeral::Intergalactic.new('pish tegj oba')
        expect(intergalactic.errors[0]).to eq("'oba' is a invalid term. The following terms accepted only: glob, prok, pish, tegj")
      end

      it 'Pish tegj return error message' do
        intergalactic = Numeral::Intergalactic.new('Pish tegj')
        expect(intergalactic.errors[0]).to eq("'Pish' is a invalid term. The following terms accepted only: glob, prok, pish, tegj")
      end
    end
  end
end

