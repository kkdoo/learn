class Authors::GetService
  def initialize(id)
    @id = id
  end

  def call
    Author.find(@id)
  end
end
