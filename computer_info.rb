module ComputerInfo
  def self.max_int
    machine_bytes = ['banana'].pack('p').size
    machine_bits = machine_bytes * 8
    2**(machine_bits-1)
  end
end