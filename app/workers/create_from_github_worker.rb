class CreateFromGithubWorker
  include Sidekiq::Worker

  def perform(scraper_id)
    scraper = Scraper.find(scraper_id)
    scraper.create_scraper_progress.update("Synching repository", 50)
    scraper.synchronise_repo
    scraper.create_scraper_progress.finished
  end
end
