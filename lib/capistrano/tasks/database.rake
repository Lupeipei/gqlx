namespace :deploy do
  desc "rake db:seed"
  task :seed do
    on primary(:db) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:seed"
        end
      end
    end
  end
end

after "deploy:migrate", "deploy:seed"
