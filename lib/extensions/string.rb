class String
  #
  # 用 * 来隐藏中字符串中间几位，以防泄露
  #
  # - 长度小于 5 个字符，只保留第一个字符: "abcd" -> "a***"
  # - 长度大于等于5，小于 11 个字符，前后各保留两个字符: "abcdefghij" -> "ab******ij"
  # - 长度大于等于 11 个字符，前保留 3 个字符，后保留 4 个字符（为了正好适应中国电话号码）: "18049986519" -> "180****6519"
  #
  # @return [String]
  #
  def cover_up
    if self.length <= 4
      return "#{self.first(1)}#{'*' * (self.length - 1)}"
    end

    if self.length < 11
      return "#{self.first(2)}#{'*' * (self.length - 4)}#{self.last(2)}"
    end

    "#{self.first(3)}#{'*' * (self.length - 7)}#{self.last(4)}"
  end

end
