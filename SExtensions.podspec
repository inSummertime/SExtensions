Pod::Spec.new do |s|
    s.name      = 'SExtensions'
    s.version   = '0.1.4'
    s.license   = 'MIT'
    s.summary   = 'Some handy extensions'
    s.homepage  = 'https://github.com/inSummertime/SExtensions'
    s.author    = { "inSummertime" => "therayfeng@gmail.com" }
    s.source    = { :git => 'https://github.com/inSummertime/SExtensions.git', :tag => s.version }
    s.ios.deployment_target = '10.0'
    s.source_files = 'Sources/**/*.swift'
    s.swift_version = '4.0'
end
