class Station

  attr_reader :name, :zone

  def initialize(name)
    @name = name.capitalize
    @zone = assign_zone
  end

  def assign_zone
    # @name[0] =~ /[A-M]/ ? 1 : 2  # alternative option to line below
    ('A'..'M').to_a.include?(@name[0]) ? 1 : 2
  end

end
