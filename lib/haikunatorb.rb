require "haikunatorb/version"

module Haikunatorb
  ADJECTIVES = ["aged", "ancient", "autumn", "billowing", "bitter", "black", "blue", "bold", "broad", "broken", "calm", "cold", "cool", "crimson", "curly", "damp", "dark", "dawn", "delicate", "divine", "dry", "empty", "falling", "fancy", "flat", "floral", "fragrant", "frosty", "gentle", "green", "hidden", "holy", "icy", "jolly", "late", "lingering", "little", "lively", "long", "lucky", "misty", "morning", "muddy", "mute", "nameless", "noisy", "odd", "old", "orange", "patient", "plain", "polished", "proud", "purple", "quiet", "rapid", "raspy", "red", "restless", "rough", "round", "royal", "shiny", "shrill", "shy", "silent", "small", "snowy", "soft", "solitary", "sparkling", "spring", "square", "steep", "still", "summer", "super", "sweet", "throbbing", "tight", "tiny", "twilight", "wandering", "weathered", "white", "wild", "winter", "wispy", "withered", "yellow", "young"]
  NOUNS = ["reizoko", "reitoko", "sentakuki", "oishii", "sashimi", "sushi", "onigiri", "katana", "anime", "maguro", "fuji", "musashi", "samurai", "ninja", "yoyo", "sakura", "keitai", "denwa", "jyudenki", "hikoki", "densha", "chikatetsu", "basu", "takushi", "jitensha", "eki", "basutei", "kuko", "shingo", "kosaten", "michi", "doro", "shogakko", "shogakko", "koko", "daigaku", "seito", "sensei", "senko", "gakui", "shiken", "shukudai", "ishi", "kangoshi", "bengoshi", "ryorinin", "jitsugyoka", "keisatsukan", "shoboshi", "gijutsusha", "komuin", "kaikeishi", "oya", "musume", "musuko", "sobo", "sofu", "karada", "atama", "kata", "ude", "ashi", "mune", "hara", "kao", "me", "hana", "kuchi", "mimi", "chita", "inu", "neko", "ushi", "buta", "uma", "hitsuji", "saru", "nezumi", "tora", "okami", "usagi", "ryu", "shika", "kaeru", "shishi", "kirin", "zo", "tori", "niwatori", "suzume", "karasu", "washi", "taka", "sakana", "tai", "ebi", "iwashi", "maguro", "katsuo", "sanma", "aji", "saba", "ika", "tako", "mushi", "cho", "semi", "tonbo", "kumo", "hotaru", "ka", "kai", "kaigara", "kuma", "ongaku", "rika", "sansu", "rekishi", "chiri", "taiiku", "supotsu", "shisutemu", "joho", "hitsuyo", "benkyo", "aka", "midori", "ao", "murasaki", "shiro", "kuro", "pinku", "orenji", "yu", "kori", "hi", "gasu", "kuki", "tsuchi", "kinzoku", "doro", "kemuri", "tetsu", "do", "kin", "gin", "namari", "shio", "kita", "higashi", "minami", "nishi", "taiyo", "tsuki", "hoshi", "tenki", "hare", "ame", "kumori", "yuki", "kaze", "kaminari", "taifu", "arashi", "sora", "nichiyobi", "getsuyobi", "kayobi", "suiyobi", "mokuyobi", "kinyobi", "doyobi", "nomimono", "cha", "ocha", "kohi", "gyunyu", "mizu", "biru", "wain", "sato", "shio", "shoyu", "kome", "ine", "mugi", "yasai", "kudamono", "imo", "mame", "daikon", "ninjin", "ringo", "mikan", "nashi", "kuri", "momo", "suika", "bunbogu", "inku", "pen", "ballborupen", "mannenhitsu", "enpitsu", "fude", "choku", "keshigomu", "enpitsukezuri", "jogi", "noto", "nikki", "futo", "hasami", "hotchikisu", "david"]

  HEX_TOKEN_CHARS = "0123456789abcdef"
  NUM_TOKEN_CHARS = "0123456789"
  ALPHA_TOKEN_CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

  class << self
    def hex(token_length)
      generator(token_length, HEX_TOKEN_CHARS, false)
    end

    def only_hex(token_length)
      generator(token_length, HEX_TOKEN_CHARS, true)
    end

    def only_num(token_length)
      generator(token_length, NUM_TOKEN_CHARS, true)
    end

    def num(token_length)
      generator(token_length, NUM_TOKEN_CHARS, false)
    end

    def alpha(token_length)
      generator(token_length, ALPHA_TOKEN_CHARS, false)
    end

    def alnum(token_length)
      generator(token_length, ALPHA_TOKEN_CHARS + NUM_TOKEN_CHARS, false)
    end

    private

    def generator(token_length, token_chars, only_hex)
      adj = ADJECTIVES[rand(ADJECTIVES.length)]
      nou = NOUNS[rand(NOUNS.length)]

      tok = ''
      token_length.times do |num|
        tok << token_chars[rand(token_chars.length)]
      end

      if only_hex
        return tok
      end

      adj + '-' + nou + '-' + tok
    end
  end
end
