# frozen_string_literal: true

class String
  def from_german_to_f
    gsub(',', '.').to_f
  end
end
