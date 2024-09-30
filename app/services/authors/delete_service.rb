class Authors::DeleteService < BaseService
  def initialize(id)
    @id = id
  end

  def call
    @author = Author.find(@id)
    @author.destroy
    @author
  end
end
