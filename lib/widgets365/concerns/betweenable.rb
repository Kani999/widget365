module Betweenable
  # Checks If the value or inputs from Array of values are
  # between the defined dispersion of the reference value
  # input = Value or Array of values
  # ref = Reference value
  # dis = dispersion from the reference value
  def between_dispersion?(input, ref, dis)
    if input.is_a?(Array)
      input.all? { |v| v.between?(ref - dis, ref + dis) }
    else
      input.between?(ref - dis, ref + dis)
    end
  end
end
