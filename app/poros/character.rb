class Character
  attr_reader :name, :house, :role, :patronus
  def initialize(info_hash)
    @name = info_hash[:name]
    @house = info_hash[:house]
    @role = info_hash[:role]
    @patronus = info_hash[:patronus]
  end
end
