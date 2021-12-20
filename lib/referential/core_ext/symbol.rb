class Symbol
  def <<(other)
    Proc.new(&self) << Proc.new(&other)
  end

  def >>(other)
    Proc.new(&self) >> Proc.new(&other)
  end
end
