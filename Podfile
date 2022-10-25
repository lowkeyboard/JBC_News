# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

# Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

workspace 'jbcnews'
#newsapi module
def newskit_pods
  pod 'Alamofire', '~> 5.5'
  pod 'AlamofireImage'
end

def application_pods
  newskit_pods
end


target 'NewsKit' do
  project 'NewsKit/NewsKit.project'
  newskit_pods
  target 'NewsKitTests' do
   inherit! :complete
      # Pods for testing
  end
end


# Pods for jbcnews
target 'jbcnews' do
  application_pods
end
  
target 'jbcnewsTests' do
 inherit! :search_paths
    # Pods for testing
end

target 'jbcnewsUITests' do
 # Pods for testing
end
