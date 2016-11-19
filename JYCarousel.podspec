

Pod::Spec.new do |s|

  s.name         = "JYCarousel"
  s.version      = "0.0.1"
  s.summary      = "Simple carousel Library"
  s.homepage     = "https://github.com/Delyer/JYCarousel.git"

  s.license      = { :type => 'Apache License, Version 2.0', :text => <<-LICENSE
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
    LICENSE
  }

  s.author             = { "Delyer" => "jiayaoit@126.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/Delyer/JYCarousel.git", :tag => s.version }
  s.source_files  = "JYCarousel", "JYCarousel/**/*.{h,m},"JYCarousel/*.{h,m}"
  s.framework  = "UIKit", "Foundation"

end
