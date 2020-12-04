Pod::Spec.new do |spec|

  spec.name         = "qclubfoo2020"
  spec.version      = "0.0.3"
  spec.summary      = "Framework for using in Day09 of Swift piscine"

  spec.description  = <<-DESC
In this framework defined CoreData stack and methods for saving and retrive articles in specific way using CoreData.
                   DESC

  spec.homepage     = "https://github.com/qclubfoo/qclubfoo2020.git"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "qclubfoo" => "dp20121989@mail.ru" }

  spec.ios.deployment_target = "12.1"
  spec.swift_version = "4.2"

  spec.source        = { :git => "https://github.com/qclubfoo/qclubfoo2020.git", :tag => "#{spec.version}" }
  spec.source_files  = "qclubfoo2020/*.{h,m,swift}"
  spec.resources = "qclubfoo2020/*.xcdatamodeld"

end


