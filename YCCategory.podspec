Pod::Spec.new do |s|
s.name = "YCCategory"
s.authors = "anyuechao"
s.homepage = "https://github.com/anyuechao/YCCategory.git"
s.summary = "YCCategory"
s.version = "1.0.0"
#s.platform = :ios, "8.0"
s.source = { :git => "https://github.com/anyuechao/YCCategory.git", :tag => s.version }

s.dependency 'MJRefresh'
s.requires_arc     = true
s.ios.deployment_target = '8.0'

s.default_subspec = 'Source'

    s.subspec 'Source' do |ss|
        ss.default_subspec = 'UIImage'

        ss.subspec 'UIImage' do |img|
            img.source_files = 'YCCategory/Source/UIkit/UIImage/**/*.{h,m}'
        end

        ss.default_subspec = 'UILabel'
        ss.subspec 'UILabel' do |lab|
            lab.source_files = 'YCCategory/Source/UIkit/UILabel/**/*.{h,m}'
        end
    end

end
