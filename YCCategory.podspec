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

s.default_subspec = 'UIImage'
s.default_subspec = 'UILabel'
s.default_subspec = 'UIApplication'
s.default_subspec = 'UIResponder'
s.default_subspec = 'UIButton'
s.default_subspec = 'UISegmentedControl'
s.default_subspec = 'UIColor'
s.default_subspec = 'UIAlertController'
s.default_subspec = 'UIView'
s.default_subspec = 'UICollectionView'
s.default_subspec = 'UIBezierPath'
s.default_subspec = 'UIViewController'
s.default_subspec = 'UITableView'
s.default_subspec = 'CAAnimation'

s.default_subspec = 'NSData'
s.default_subspec = 'NSIndexPath'
s.default_subspec = 'NSString'
s.default_subspec = 'NSUserDefaults'
s.default_subspec = 'NSNumber'
s.default_subspec = 'NSTimer'
s.default_subspec = 'NSObject'
s.default_subspec = 'NSDecimalNumber'

    s.subspec 'UIImage' do |img|
        img.source_files = 'YCCategory/Source/UIkit/UIImage/**/*.{h,m}'
    end

    s.subspec 'UILabel' do |lab|
        lab.source_files = 'YCCategory/Source/UIkit/UILabel/**/*.{h,m}'
    end

    s.subspec 'UIApplication' do |app|
        app.source_files = 'YCCategory/Source/UIkit/UIApplication/**/*.{h,m}'
    end

    s.subspec 'UIResponder' do |res|
        res.source_files = 'YCCategory/Source/UIkit/UIResponder/**/*.{h,m}'
    end

    s.subspec 'UIButton' do |btn|
        btn.source_files = 'YCCategory/Source/UIkit/UIButton/**/*.{h,m}'
    end

    s.subspec 'UISegmentedControl' do |seg|
        seg.source_files = 'YCCategory/Source/UIkit/UISegmentedControl/**/*.{h,m}'
    end
    s.subspec 'UIColor' do |clor|
        clor.source_files = 'YCCategory/Source/UIkit/UIColor/**/*.{h,m}'
    end

    s.subspec 'UIAlertController' do |alert|
        alert.source_files = 'YCCategory/Source/UIkit/UIAlertController/**/*.{h,m}'
    end

    s.subspec 'UIView' do |view|
        view.source_files = 'YCCategory/Source/UIkit/UIView/**/*.{h,m}'
    end
    s.subspec 'UICollectionView' do |clec|
        clec.source_files = 'YCCategory/Source/UIkit/UICollectionView/**/*.{h,m}'
    end

    s.subspec 'UIBezierPath' do |blz|
        blz.source_files = 'YCCategory/Source/UIkit/UIBezierPath/**/*.{h,m}'
    end

    s.subspec 'UIViewController' do |vc|
        vc.source_files = 'YCCategory/Source/UIkit/UIViewController/**/*.{h,m}'
    end
    s.subspec 'UITableView' do |tbv|
        tbv.source_files = 'YCCategory/Source/UIkit/UITableView/**/*.{h,m}'
    end
    s.subspec 'CAAnimation' do |ca|
        ca.source_files = 'YCCategory/Source/UIkit/CAAnimation/**/*.{h,m}'
    end

    s.subspec 'NSData' do |dat|
        dat.source_files = 'YCCategory/Source/Foundation/NSData/**/*.{h,m}'
    end

    s.subspec 'NSIndexPath' do |inx|
        inx.source_files = 'YCCategory/Source/Foundation/NSIndexPath/**/*.{h,m}'
    end

    s.subspec 'NSString' do |str|
        str.source_files = 'YCCategory/Source/Foundation/NSString/**/*.{h,m}'
    end

    s.subspec 'NSUserDefaults' do |usd|
        usd.source_files = 'YCCategory/Source/Foundation/NSUserDefaults/**/*.{h,m}'
    end

    s.subspec 'NSNumber' do |num|
        num.source_files = 'YCCategory/Source/Foundation/NSNumber/**/*.{h,m}'
    end


    s.subspec 'NSTimer' do |tim|
        tim.source_files = 'YCCategory/Source/Foundation/NSTimer/**/*.{h,m}'
    end


    s.subspec 'NSObject' do |obj|
        obj.source_files = 'YCCategory/Source/Foundation/NSObject/**/*.{h,m}'
    end


    s.subspec 'NSDecimalNumber' do |deic|
        deic.source_files = 'YCCategory/Source/Foundation/NSDecimalNumber/**/*.{h,m}'
    end

end
