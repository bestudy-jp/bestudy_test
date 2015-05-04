class Integer
  def to_currency()
    self.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\1,').reverse
  end
end
