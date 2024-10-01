require 'sidekiq'
require 'sidekiq/web'

Sidekiq.default_job_options = {
  backtrace: true,
  retry: true,
}

Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch("SIDEKIQ_REDIS_URL", 'redis://redis:6379/0'), network_timeout: 3, pool_timeout: 3 }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch("SIDEKIQ_REDIS_URL", 'redis://redis:6379/0'), network_timeout: 3, pool_timeout: 3 }
end

if Rails.env.production?
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    # Protect against timing attacks:
    # - See https://codahale.com/a-lesson-in-timing-attacks/
    # - See https://thisdata.com/blog/timing-attacks-against-string-comparison/
    # - Use & (do not use &&) so that it doesn't short circuit.
    # - Use digests to stop length information leaking
    # - (see also ActiveSupport::SecurityUtils.variable_size_secure_compare)
    ActiveSupport::SecurityUtils.secure_compare(
      ::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_USERNAME"])
    ) &
      ActiveSupport::SecurityUtils.secure_compare(
        ::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_PASSWORD"])
      )
  end
end
