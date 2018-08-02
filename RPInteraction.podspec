Pod::Spec.new do |s|
  s.name             = 'RPInteraction'
  s.version          = '0.1.1'
  s.summary          = 'Review page interaction - handy and pretty way to ask for review.'

  s.description      = <<-DESC
Review page interaction - handy and pretty way to ask for review.
Inspired by https://dribbble.com/shots/4332677-Review-Page-Interaction.
How to use:
1. Create an instance of RPViewController()
2. Set titles, fonts and colors
3. Present it!
                       DESC

  s.homepage         = 'https://github.com/nbolatov/RPInteraction'
  s.screenshots      = 'https://cdn.dribbble.com/users/1233499/screenshots/4332677/attachments/987086/attachment.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'nbolatov' => 'nurda.bolatov@gmail.com' }
  s.source           = { :git => 'https://github.com/nbolatov/RPInteraction.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'RPInteraction/Classes/**/*'

  s.resource_bundles = {
      'RPInteraction' => ['RPInteraction/Assets/*.png']
  }

  s.requires_arc = true
  s.ios.frameworks = 'UIKit', 'Foundation'
end
