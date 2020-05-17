namespace :deploy do
  task :yarn do
    on release_roles(:app) do
      within release_path do
        execute "bin/yarn"
      end
    end
  end
end

after 'deploy:updated', 'deploy:yarn'
