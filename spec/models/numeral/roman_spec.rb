RSpec.describe 'Numeral::Roman' do |variable|
  describe 'When numbers are valids' do
    context 'and convert to arabic number' do
      it 'MMVI is 2006' do
        arabic = Numeral::Roman.new('MMVI').to_arabic
        expect(arabic).to eq(2006)
      end

      it 'MCMXLIV is 1944' do
        arabic = Numeral::Roman.new('MCMXLIV').to_arabic
        expect(arabic).to eq(1944)
      end
    end
  end

  describe 'When numbers are invalids' do
    context 'and there is a symbol that exceed three times repetation in succession' do
      it 'CCCCL return error message' do
        roman = Numeral::Roman.new('CCCCL')
        expect(roman.errors[0]).to eq('The symbol C can only be repeated three times in succession.')
      end

      it 'LIIII return error message' do
        roman = Numeral::Roman.new('LIIII')
        expect(roman.errors[0]).to eq('The symbol I can only be repeated three times in succession.')
      end

      it 'LXXXX return error message' do
        roman = Numeral::Roman.new('LXXXX')
        expect(roman.errors[0]).to eq('The symbol X can only be repeated three times in succession.')
      end

      it 'MMMM return error message' do
        roman = Numeral::Roman.new('MMMM')
        expect(roman.errors[0]).to eq('The symbol M can only be repeated three times in succession.')
      end
    end

    context 'and there is a symbol that never can be repetead' do
      it 'MMDDC return error message' do
        roman = Numeral::Roman.new('MMDDC')
        expect(roman.errors[0]).to eq('The symbol D can never be repeated in succession.')
      end

      it 'CLLX return error message' do
        roman = Numeral::Roman.new('CLLX')
        expect(roman.errors[0]).to eq('The symbol L can never be repeated in succession.')
      end

      it 'XVV return error message' do
        roman = Numeral::Roman.new('XVV')
        expect(roman.errors[0]).to eq('The symbol V can never be repeated in succession.')
      end
    end

    context 'and there is invalid_subtraction' do
      it 'MDM return error message' do
        roman = Numeral::Roman.new('MDM')
        expect(roman.errors[0]).to eq('DM is a invalid subtraction')
      end

      it 'MIL return error message' do
        roman = Numeral::Roman.new('MIL')
        expect(roman.errors[0]).to eq('IL is a invalid subtraction')
      end

      it 'LVX return error message' do
        roman = Numeral::Roman.new('LVX')
        expect(roman.errors[0]).to eq('VX is a invalid subtraction')
      end

      it 'MVM return error message' do
        roman = Numeral::Roman.new('MVM')
        expect(roman.errors[0]).to eq('VM is a invalid subtraction')
      end

      it 'MLC return error message' do
        roman = Numeral::Roman.new('MLC')
        expect(roman.errors[0]).to eq('LC is a invalid subtraction')
      end

      it 'XIIV return error message' do
        roman = Numeral::Roman.new('XIIV')
        expect(roman.errors[0]).to eq('IIV is a invalid subtraction')
      end

      it 'MCCMXLIV return error message' do
        roman = Numeral::Roman.new('MCCMXLIV')
        expect(roman.errors[0]).to eq('CCM is a invalid subtraction')
      end

    end
  end
end
