package v4.navigation;


class Arrows extends NavigationBase, implements NavigationInterface {
	
	
	var butLeft :RCButton;
	var butRight :RCButton;
	var butExit :RCButton;
	var butPlayPause :RCButton;
	var butSound :RCButton;
	var butFullScreen :RCButton;
	
	
	override public function init () {
		
		addLeftButton();
		//addExitButton( false );
		addRightButton();
		
/*		mouse = new RCMouse ( RCWindow.target, mouseArea, mouseArea );
		mouse.onMiddle = showMiddle;
		mouse.onLeft = showLeft;
		mouse.onRight = showRight;*/
		//mouse.onOver = show;
		//mouse.onOut = hide;
		
		
/*		if (Session.get("viewer") == "slideshow") {
			
			addPlayPauseButton ( Session.get ("slideshow_is_running") );
			if (SoundManager.exists() && Session.get ("slideshow_is_running") == false)
				addSoundButton();
		}*/
	}
	
	/**
	 *	Add start/stop slideshow and sound buttons
	 */
	function addLeftButton () {
		
		var s = new SkinButtonWithImage ( Config.THEME_PATH + "ArrowLeft.png", Config.THEME_PATH + "ArrowLeftHighlighted.png" );
		butLeft = new RCButton (0, 0, s);
		butLeft.onRelease = goLeft;
		this.addChild ( butLeft );
		butLeft.init();
	}
	
	function addRightButton () {
		
		var s = new SkinButtonWithImage ( Config.THEME_PATH + "ArrowRight.png", Config.THEME_PATH + "ArrowRightHighlighted.png" );
		butRight = new RCButton (0, 0, s);
		butRight.onRelease = goRight;
		this.addChild ( butRight );
		butRight.init();
	}
	function addExitButton (?shadowed:Bool=true) {
/*		butExit = constructButtonNavigation ( new ArrowView ("skin_arrow_exit", colorArrow, shadowed) );
		butExit.onClick = exit;
		this.addChild ( butExit );*/
	}
	
	
	function addFullScreenButton () {
		// Add the fullscreen button only once

/*		if (Preferences.boolForKey("enable_fullscreen") && arr == null) {
			#if flash
				var o = new SkinEnterFullScreen (0, 0, 0xbbbbbb);
				var s = new SkinButtonWithObject (o, COLORS);
			#elseif js
				var s = new SkinButtonWithImage (Config.THEME_PATH+"FullScreenOn.png");
			#end
			
			butFullScreen = new RCButton (RCWindow.sharedWindow().width - 21, 1, s);
			butFullScreen.onRelease = callback (clickHandler, "fullscreen");
			//IMAppDelegate.view.layerInfo.addChild ( butFullScreen );
			
			RCNotificationCenter.addObserver ("fullscreen", fullScreenHandler);
			fullScreenHandler();
		}*/
	}
	
	
	function showLeft () {
		hideMiddle();
		butLeft.alpha = 1;
		butRight.alpha = .4;
	}
	function showRight () {
		hideMiddle();
		butLeft.alpha = .4;
		butRight.alpha = 1;
	}
	function showMiddle () {
		Fugu.safeAdd ( this, butExit );
		Fugu.safeRemove ( [butLeft, butRight] );
	}
	function hideMiddle () {
		Fugu.safeRemove ( butExit );
		Fugu.safeAdd ( this, [butLeft, butRight] );
	}
	function show () {
		this.visible = true;
	}
	function hide () {
		this.visible = false;
	}
	
	/**
	 * Construct buttons
	 */
/*	function constructButtonNavigation (obj:ArrowView) :RCButton {
		var s = new SkinButtonWithArrow (obj, [null, null, colorArrow, colorArrowOver]);
		var b = new RCButton (0, 0, s);
		return b;
	}
	
	function constructButtonStartStop (obj:ArrowView) :RCButton {
		var s = new SkinButtonWithArrow (obj, [colorBackground, colorBackground,
														colorArrow, colorArrowOver]);
		var b = new RCButton (0, 0, s);
		return b;
	}
	function constructButtonSound (index:Int) :RCButton {
		var label = "";
		var s = new SkinRoundedButtonWithText (label, [colorBackground, colorBackground,
														colorArrow, colorArrowOver]);
		var b = new RCButton (0, 0, s);
		return b;
	}*/
	
	
/*	override function addExitButton () {
		if (Session.get("viewer") == "slideshow") {
			butExit = constructButtonSound ( RCLocalization.list.back );
			butExit.onClick = exit;
			this.addChild ( butExit );
		}
	}*/
	
	
	
	override public function resize  (limits:RCRect) {
		
		// x alignment
		butLeft.x = Math.round (limits.origin.x - butLeft.width - 20);
		butRight.x = Math.round (limits.origin.x + limits.size.width + 20);
		
		// arrange buttons in the middle on Y axis
		butLeft.y = Math.round (limits.origin.y + (limits.size.height - butLeft.height) / 2);
		butRight.y = Math.round (limits.origin.y + (limits.size.height - butRight.height) / 2);
		/*
		if (butPlayPause != null) {
			butPlayPause.x = Math.round ( (limits.size.width - butPlayPause.size.width) / 2 );
			butPlayPause.y = Math.round ( (limits.size.height - butPlayPause.size.height) / 2 );
		}
		if (butSound != null) {
			butSound.x = butPlayPause.x;
			butSound.y = Math.round ( butPlayPause.y + butPlayPause.size.height + 10 );
		}
		if (butExit != null) {
			butExit.x = Math.round (limits.size.width / 2);
			butExit.y = (butSound != null)
						? Math.round ( butSound.y + butSound.size.height + 10 )
						: (butPlayPause != null)
							? Math.round ( butPlayPause.y + butPlayPause.height + 10 )
							: Math.round (limits.size.height / 2);
		}*/
	}
	
}