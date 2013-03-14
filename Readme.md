Collection of view-related additions
====================================

UIView(FTAdditions)
-------------------
**explode**

Dumps the view hierarchy. In constrast to the standard `recursiveDescription` it displays the absolute window coordinates right in front making it easier to understand the positioning of the views.

    - (void) explode

Sample output:

	(lldb) po [webView explode]
	  {{14, 154}, {290, 57}} UIWebView (<UIWebView: 0x1b42cdd0; baseClass = UIWebView; frame = (14 0; 290 57); text = 'We are open, all right. W...'; opaque = NO; tag = 7; layer = <CALayer: 0x12527130>>)
	  {{14, 154}, {290, 57}} -_UIWebViewScrollView:UIWebScrollView (<_UIWebViewScrollView: 0x1b42cbc0; frame = (0 0; 290 57); clipsToBounds = YES; autoresize = H; gestureRecognizers = <NSArray: 0x12545830>; layer = <CALayer: 0x1b459fa0>; contentOffset: {0, 0}>)
	   {{14, 154}, {54, 54}} --UIImageView:UIView (<UIImageView: 0x1b447db0; frame = (0 0; 54 54); transform = [-1, 0, -0, -1, 0, 0]; alpha = 0; hidden = YES; opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x1b49ec30>> - (null))
	   {{14, 154}, {54, 54}} --UIImageView:UIView (<UIImageView: 0x1b4e5f30; frame = (0 0; 54 54); transform = [0, 1, -1, 0, 0, 0]; alpha = 0; hidden = YES; opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x1250ada0>> - (null))
	   {{14, 154}, {54, 54}} --UIImageView:UIView (<UIImageView: 0x125355c0; frame = (0 0; 54 54); transform = [0, -1, 1, 0, 0, 0]; alpha = 0; hidden = YES; opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x1b4d4880>> - (null))
	   {{14, 154}, {54, 54}} --UIImageView:UIView (<UIImageView: 0x1b4a7700; frame = (0 0; 54 54); alpha = 0; hidden = YES; opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x1b462610>> - (null))
	{{-0.5, 168.5}, {30, 1}} --UIImageView:UIView (<UIImageView: 0x1b4b75d0; frame = (-14.5 14.5; 30 1); transform = [0, 1, -1, 0, 0, 0]; alpha = 0; hidden = YES; opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x1b44c380>> - (null))
	{{-0.5, 168.5}, {30, 1}} --UIImageView:UIView (<UIImageView: 0x1b42fed0; frame = (-14.5 14.5; 30 1); transform = [0, -1, 1, 0, 0, 0]; alpha = 0; hidden = YES; opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x1250e4c0>> - (null))
		{{14, 154}, {1, 30}} --UIImageView:UIView (<UIImageView: 0x1256a420; frame = (0 0; 1 30); transform = [-1, 0, -0, -1, 0, 0]; alpha = 0; hidden = YES; opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x1b4d8bc0>> - (null))
		{{14, 154}, {1, 30}} --UIImageView:UIView (<UIImageView: 0x1b447740; frame = (0 0; 1 30); alpha = 0; hidden = YES; opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x1b46a670>> - (null))
	  {{14, 181}, {290, 30}} --UIImageView:UIView (<UIImageView: 0x1256bd50; frame = (0 27; 290 30); alpha = 0; hidden = YES; opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x1252d540>> - (null))
	  {{14, 154}, {290, 30}} --UIImageView:UIView (<UIImageView: 0x1b46c580; frame = (0 0; 290 30); transform = [-1, 0, -0, -1, 0, 0]; alpha = 0; hidden = YES; opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x1b49c2d0>> - (null))
	  {{14, 154}, {290, 57}} --UIWebBrowserView:UIWebDocumentView (<UIWebBrowserView: 0x15857e00; frame = (0 0; 290 57); text = 'We are open, all right. W...'; opaque = NO; gestureRecognizers = <NSArray: 0x1b42ba70>; layer = <UIWebLayer: 0x1b4cbf60>>)
	
**path**

Similarly to `explode` there's `path` to go up the view hierarchy until the window.

**recursiveSubviewsOfKind:**

Returns an array of descendant views (immediate or distant subviews) that are instances of `classname` or an instance of any class that inherits from that class.

    - (NSArray*)recursiveSubviewsOfKind:(Class)classname

**superviewOfKind:**

Returns the first view in the superview hierarchy that is an instance of `classname` or an instance of any class that inherits from that class. Returns `nil` if no matching view is found.

    - (UIView*)superviewOfKind:(Class)classname
    

**ftViewController**

Returns the corresponding view controller for the view by going up the responder chain.

    - (UIViewController*)ftViewController


FTButton
--------
A `UIButton` subclass with an additional property to define insets for the hit test area of the button. Negative insets increase the hit area. The hit area is limited by the hit area of the superview.

	@property (nonatomic) UIEdgeInsets hitTestEdgeInsets;


FTLabel
-------
A `UILabel` subclass implementing two additional properties:

**highlightedShadowColor**

`UIColor` for the shadow in highlighted mode.

**highlightedShadowOffset**

`CGSize` for the shadow offset in highlighted mode.



License
-------
Licensed under [CC-BY-SA 3.0](http://creativecommons.org/licenses/by-sa/3.0/).

You are free to share, adapt and make commercial use of the work as long as you give attribution and keep this license. To give credit, we suggest this text in the about screen or App Store description: "Uses FTAdditions by Ortwin Gentz", with a link to the [GitHub page](https://github.com/futuretap/FTAdditions).

If you need a different license without attribution requirement, please contact me and we can work something out.