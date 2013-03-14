Collection of view-related additions
====================================

UIView(FTAdditions)
-------------------
**explode**

Dumps the view hierarchy. In constrast to the standard `recursiveDescription` it displays the absolute window coordinates right in front making it easier to understand the positioning of the views.

    - (void) explode

Sample output:

	(lldb) po [webView explode]
	   {{0, 20}, {320, 548}} UIWebView:UIView (<UIWebView: 0xb945720; 
	   {{0, 20}, {320, 548}} -_UIWebViewScrollView:UIWebScrollView (<_
		 {{0, 20}, {54, 54}} --UIImageView:UIView (<UIImageView: 0xb94
		 {{0, 20}, {54, 54}} --UIImageView:UIView (<UIImageView: 0xb94
		 {{0, 20}, {54, 54}} --UIImageView:UIView (<UIImageView: 0xb94
		 {{0, 20}, {54, 54}} --UIImageView:UIView (<UIImageView: 0xb94
	{{-14.5, 34.5}, {30, 1}} --UIImageView:UIView (<UIImageView: 0xb94
	{{-14.5, 34.5}, {30, 1}} --UIImageView:UIView (<UIImageView: 0xb94
		  {{0, 20}, {1, 30}} --UIImageView:UIView (<UIImageView: 0xb94
		  {{0, 20}, {1, 30}} --UIImageView:UIView (<UIImageView: 0xb94
	   {{0, 538}, {320, 30}} --UIImageView:UIView (<UIImageView: 0xb94
		{{0, 20}, {320, 30}} --UIImageView:UIView (<UIImageView: 0xb94
	   {{0, 20}, {320, 548}} --UIWebBrowserView:UIWebDocumentView (<UI
	
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