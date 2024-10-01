class Authors::DeleteService < BaseService
  class LastAuthorUndeletable < StandardError; end

  def initialize(id)
    @id = id
  end

  def call
    @author = Author.find(@id)

    if new_author
      @author.courses.update_all(author_id: new_author.id)
      @author.destroy
    else
      # TODO: we can't delete Highlander?
      raise LastAuthorUndeletable
    end

    @author
  end

  protected

  def new_author
    @new_author ||= Author.order('RANDOM()').take
  end
end
