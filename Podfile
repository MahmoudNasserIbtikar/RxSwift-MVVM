# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def ui_pods
  pod 'MessageViewController'
  pod 'SwiftMessages', :git => 'https://github.com/MahmoudNasserIbtikar/SwiftMessages.git'
  pod 'NVActivityIndicatorView', '~> 4.8.0'
  pod 'Windless', :git => 'https://github.com/Sob7y/Windless'
end


def date_tools
  pod 'DateToolsSwift'
end

def network_pods
  pod 'Moya'
  pod 'ObjectMapper'
  pod 'SDWebImage'
end

target 'rxSwift' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for rxSwift
  
  ui_pods
  date_tools
  network_pods
  
  target 'rxSwiftTests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  target 'rxSwiftUITests' do
    # Pods for testing
  end
  
end
