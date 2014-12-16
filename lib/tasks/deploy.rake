 require 'paratrooper'

 namespace :deploy do
   desc 'Deploy app in staging environment'
   task :staging do
     deployment = Paratrooper::Deploy.new("letters-course-app-staging", tag: 'staging')

     deployment.deploy
   end

   desc 'Deploy app in production environment'
   task :production do
     deployment = Paratrooper::Deploy.new("thawing-brook-6273") do |deploy|
       deploy.tag              = 'production',
       deploy.match_tag        = 'staging',
       deploy.maintenance_mode = !ENV['NO_MAINTENANCE']
     end

     deployment.deploy
   end
 end