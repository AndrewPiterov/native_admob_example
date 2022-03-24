// TODO: Import google_mobile_ads
import google_mobile_ads

// TODO: Implement ListTileNativeAdFactory
class ListTileNativeAdFactory : FLTNativeAdFactory {

    func createNativeAd(_ nativeAd: GADNativeAd,
                        customOptions: [AnyHashable : Any]? = nil) -> GADNativeAdView? {
        
          let nibObjects = Bundle.main.loadNibNamed("ListTileNativeAdView", owner: nil, options: nil)
          let nativeAdView = nibObjects!.first as! GADNativeAdView
        (nativeAdView.headlineView as? UILabel)?.text = nativeAd.headline
        nativeAdView.mediaView?.layer.cornerRadius = 12
        nativeAdView.mediaView?.clipsToBounds = true
        nativeAdView.mediaView?.mediaContent = nativeAd.mediaContent

        // Some native ads will include a video asset, while others do not. Apps can use the
        // GADVideoController's hasVideoContent property to determine if one is present, and adjust their
        // UI accordingly.
        let mediaContent = nativeAd.mediaContent
        if mediaContent.hasVideoContent {
          // By acting as the delegate to the GADVideoController, this ViewController receives messages
          // about events in the video lifecycle.
          //mediaContent.videoController.delegate = self
          //videoStatusLabel.text = "Ad contains a video asset."
        } else {
         // videoStatusLabel.text = "Ad does not contain a video."
        }

        // This app uses a fixed width for the GADMediaView and changes its height to match the aspect
        // ratio of the media it displays.
        
        // These assets are not guaranteed to be present. Check that they are before
        // showing or hiding them.
        (nativeAdView.bodyView as? UILabel)?.text = nativeAd.body
        nativeAdView.bodyView?.isHidden = nativeAd.body == nil
        (nativeAdView.callToActionView as? UIButton)?.setTitle(nativeAd.callToAction, for: .normal)
        nativeAdView.callToActionView?.isHidden = nativeAd.callToAction == nil

        (nativeAdView.iconView as? UIImageView)?.image = nativeAd.icon?.image
         nativeAdView.iconView?.isHidden = nativeAd.icon == nil

        

        (nativeAdView.storeView as? UILabel)?.text = nativeAd.store
        nativeAdView.storeView?.isHidden = nativeAd.store == nil

        

        (nativeAdView.advertiserView as? UILabel)?.text = nativeAd.advertiser
        nativeAdView.advertiserView?.isHidden = nativeAd.advertiser == nil

        // In order for the SDK to process touch events properly, user interaction should be disabled.
        nativeAdView.callToActionView?.isUserInteractionEnabled = false

        // Associate the native ad view with the native ad object. This is
        // required to make the ad clickable.
        // Note: this should always be done after populating the ad views.
        nativeAdView.nativeAd = nativeAd

        return nativeAdView
    }
}
