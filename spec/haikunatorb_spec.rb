RSpec.describe Haikunatorb do
  TOKEN_LENGTH = 7
  STR_NUMS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

  it "has a version number" do
    expect(Haikunatorb::VERSION).not_to be nil
  end

  context '「hex」を呼び出した場合' do
    it '指定したtoken数とhexが返却されること' do
      res = Haikunatorb.hex(TOKEN_LENGTH).split('-')

      expect(res[2].length).to eq TOKEN_LENGTH
      expect(('g'..'Z').cover?(res[2])).to eq false
    end
  end

  context '「only_hex」を呼び出した場合' do
    it '指定したtoken数とhexのみが返却されること' do
      res = Haikunatorb.only_hex(TOKEN_LENGTH)

      expect(res.length).to eq TOKEN_LENGTH
      expect(('g'..'Z').cover?(res)).to eq false
    end
  end

  context '「num」を呼び出した場合' do
    it '指定したtoken数とnumが返却されること' do
      res = Haikunatorb.num(TOKEN_LENGTH).split('-')

      expect(res[2].length).to eq TOKEN_LENGTH
      expect(('a'..'Z').cover?(res[2])).to eq false
    end
  end

  context '「only_num」を呼び出した場合' do
    it '指定したtoken数とnumのみが返却されること' do
      res = Haikunatorb.only_num(TOKEN_LENGTH)

      expect(res.length).to eq TOKEN_LENGTH
      expect(('a'..'Z').cover?(res)).to eq false
    end
  end

  context '「alpha」を呼び出した場合' do
    it '指定したtoken数とalphabetが返却されること' do
      res = Haikunatorb.alpha(TOKEN_LENGTH).split('-')

      expect(res[2].length).to eq TOKEN_LENGTH
      STR_NUMS.each do | num |
        expect(num.include?(res[2])).to eq false
      end
    end
  end

  context '「alphanum」を呼び出した場合' do
    it '指定したtoken数とalphanumが返却されること' do
      res = Haikunatorb.alnum(TOKEN_LENGTH).split('-')

      expect(res[2].length).to eq TOKEN_LENGTH
    end
  end
end
