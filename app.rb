require 'sinatra'

NEW_URL = "https://guides.cocoapods.org"
ROUTES = {
  "/" => "/",
  
  # References
  "/podfile.html" => "/syntax/podfile.html",
  "/specification.html"=> "/syntax/podspec.html",
  "/commands.html"=> "/terminal/commands.html",
  
  # Guides
  "/guides/philosophy.html"=> "/using/faq.html",
  "/guides/installing_cocoapods.html" => "/using/getting-started.html",
  "/guides/dependency_versioning.html" => "/using/the-podfile.html",
  "/guides/closed_source_pods.html" => "/making/private-cocoapods.html",
  "/guides/working_with_teams.html" => "/making/private-cocoapods.html",
  "/guides/contributing_to_the_master_repo.html" => "/making/specs-and-specs-repo.html",
  "/guides/creating_and_maintaining_a_pod.html" => "/making/specs-and-specs-repo.html#how-do-i-update-an-existing-pod?",
  "/guides/creating_your_own_repository.html" => "/making/private-cocoapods.html",
  
  # Gem specifics should be handled by rubydoc 
  "/cocoapods/*" => "http://rubydoc.info/gems/cocoapods",
  "/cocoapods_core/*" => "http://rubydoc.info/gems/cocoapods-core",
  "/xcodeproj/*" => "http://rubydoc.info/gems/xcodeproj",
  "/claide/*" => "http://rubydoc.info/gems/claide",
  "/cocoapods_downloader/*" => "http://rubydoc.info/gems/cocoapods-downloader"
}

ROUTES.each_key do |key|

  # Create a sinatra route for each key, check if it's value starts with http
  # and either redirect to the new site with the same query.
  
   get key do
     if (ROUTES[key][0..3] == "http") 
       redirect ROUTES[key]
     else
      redirect NEW_URL + ROUTES[key] + request.query_string
     end
   end
 end 
 
 # If we've missed anything just go to the root of the new URL
 
 error Sinatra::NotFound do
   redirect NEW_URL + request.query_string
 end
