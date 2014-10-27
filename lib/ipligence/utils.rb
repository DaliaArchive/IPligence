module Ipligence::Utils

  def self.convert_dotted_to_long(ip)
    dotted_ip_array = ip.split(".").map(&:to_i)
    (dotted_ip_array[0] * 256 * 256 * 256) + (dotted_ip_array[1] * 256 * 256) + (dotted_ip_array[2] * 256) + (dotted_ip_array[3])
  end

end