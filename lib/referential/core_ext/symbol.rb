class Symbol
  def call(*args)
    to_proc.call(*args)
  end

  def <<(other)
    to_proc << Proc.new(&other)
  end

  def >>(other)
    to_proc >> Proc.new(&other)
  end
end
