class DeleteAuthorJob
  include Sidekiq::Job

  def perform(*args)
    author_id = args[0]

    Authors::DeleteService.new(author_id).call
  end
end
