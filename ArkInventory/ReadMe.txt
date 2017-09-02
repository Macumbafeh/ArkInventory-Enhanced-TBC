General:

    * home page - http://arkinventory.googlecode.com/

	* betas;
		* backup your saved variables file for arkinventory
		* when installing a new beta always restore a copy of your saved variabes from the backup you made (so it's starts clean - theres usually no automatic upgrade between beta versions)

	* example rules - http://code.google.com/p/arkinventory/wiki/ExampleRules
	
	* download from;
		* google code - http://code.google.com/p/arkinventory/downloads/list
		* wow interface - http://www.wowinterface.com/downloads/info6488
		* curse gaming - http://wow.curse.com/downloads/wow-addons/details/ark-inventory.aspx
		* wow ui - http://wowui.worldofwar.net/?p=mod&m=4504
		
	* use WoW UI Updater to keep all your mods up to date - http://wuu.vagabonds.info/
	
	


Overview:

    * unlimited number of bars (there are practical limits though before your screen becomes full)
    * assign items to a category of your choice (overrides the default assignment)
    * assign categories to the bar of your choice
    * configurable bars per row
    * configurable width
    * display bank, bag, keyrings for current and alts across all realms
    * separate keybindings for bag, keyring and bank viewing
    * /arkinv ui reset (puts the windows back in the centre of the screen)
    * /arkinv db reset confirm (resets all user options back to defaults)
    * /arkinv cache erase confirm (erases all cached data - not options)

	
Key Bindings (How To):

	Press ESCAPE to bring up the blizzard menu
	click on Key Bindings
	scroll down to ArkInventory
	bind the keys you want to use to specific functions
	
	
Issues:
	* the background can appear in front of the items rendering them unuseable - note this is not an ai code problem, it would appear to be an issue with blizzards CreateFrame api function.  a workaround for this issue is included in the addon but will spam warnings to your chat window, you can disble them by entering /ai misc alert disable.


Bugs:
	* guild bank (vault) can have display issues on first open, just change tabs or refresh
	
	
To Do:
	* bar growth direction, vertical or horizontal
	* some way to show slot type when theres an item in it (like coloured borders but it can't screw up the existing rarity border colouring)
	* add tooltips when over a frame that shows what categories are in the frame
	


Version History:
	* see VersionHistory.txt or http://code.google.com/p/arkinventory/wiki/VersionHistory
