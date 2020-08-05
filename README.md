# RecountRenovated
A modernization of the Recount combat modification for The Elder Scrolls Online (ESO) 

## Overview
Recount is a damage meter and combat log addon which is still in development.

Based on Fayn's work (original Copyright by him)
Updated and maintained by McGuffin since 0.4.0
Updated by Shadow-Fighter since 0.5.1
Updated by lwndow since 0.6.4

This addon uses the following libraries:
- "LibAddonMenu-2.0" (http://www.esoui.com/downloads/info7-LibAddonMenu.html)
- "LibMediaProvider-1.0" (http://www.esoui.com/downloads/info56-LibMediaProvider.html)

### Available Slash Commands
```
/recount
/recount hide
/recount show
/recount min
/recount restore
/recount mode
/recount reset
```

### How To Manually Install:
Go to the "Elder Scrolls Online" folder in your Documents

  For Windows: C:\Users\<username>\Documents\Elder Scrolls Online\<version>\
  For Mac: ~/Documents/Elder Scrolls Online/<version>/

  (replace <version> with the client you're using - "live" or "liveeu")

* You should find an AddOns folder, if you don't, create one.
* Extract the addon from downloaded zip file to the AddOns folder
* Log into the game, and in the character creation screen, you'll find the Addons menu. Enable your addons from there.

### Release History
#### 0.6.4 (lwndow)
* updated to API 100031 (Greymoor) & 100032 (Stonethorn)
* removed libstub dependency
* added hard dependencies, removed embedded libs (you need to grab them from ESOUI/Minion)
* added request from forum to ignore values below a certain threshold in the log

#### v0.6.3 (Shadow-Fighter)
* updated to API 100024

#### v0.6.2 (Shadow-Fighter)
* updated LibAddonMenu-2.0 r24 to LibAddonMenu-2.0 r26

#### v0.6.1 (Shadow-Fighter)
* updated to API 100023

#### v0.6.0 (Shadow-Fighter)
* updated to API 100021

#### v0.5.9 (Shadow-Fighter)
* able to change font face, size, color from settings menu

#### v0.5.8 (Shadow-Fighter)
* updated LibAddonMenu-2.0 r17 to LibAddonMenu-2.0 r24

#### v0.5.7 (Shadow-Fighter)
* updated to API 100020

#### v0.5.6 (Shadow-Fighter)
* updated to API 100019

#### v0.5.5 (Garkin)
* updated from LibAddonMenu-1.0 to LibAddonMenu-2.0
* added LibMediaProvider-1.0 support
* minor changes

#### v0.5.4 (Shadow-Fighter)
* updated to API 100011 (Update 6)
* minor changes

#### v0.5.3 (Shadow-Fighter)
* Added "COPYRIGHT" file
* Removed Zos disclaimer from Recount.txt and added into COPYRIGHT file
* Added credits to Seerah's LibStub and LibAddonMenu into COPYRIGHT file

#### v0.5.2 (Shadow-Fighter)
* Added "ReadMe.rtf" file (this document)
* Updated LibAddonMenu-1.0
* Enabled the settings menu again

#### v0.5.1 (Shadow-Fighter)
* Settings menu is temporary disabled to work with the Update 5
* Addon menu revised to Update 5
* API Version updated to 100010 (Update 5)

#### v0.5.0 (McGuffin)
* Updated api version
* Added an option to disable auto show/hide switches. If enabled, the RecountUI can only be toggled through command shortcuts
* Added Zos disclaimer in Recount.txt

#### pre v5
* info about versions prior to v5 are in `VERSIONS.md` in the repo


-----------------------------------------------------------------
