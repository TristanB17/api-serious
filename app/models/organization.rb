class Organization
  attr_reader :name, :image, :description

  def initialize(org_info)
    @name = org_info[:login]
    @image = org_info[:avatar_url]
    @description = org_info[:description]
  end
end
