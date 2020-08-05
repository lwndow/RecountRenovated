#### v0.4.9 (McGuffin)
* using a self damage skill (like equilibrium) doesnt start a new combat session anymore

#### v0.4.8 (McGuffin)
* Added a shortcut to switch modes backward. The existing one still switches modes forward.
* The dps is now calculated with a minimum 1 second timeframe, to avoid crazy unrealistic spikes.
* Added a player death detection to fix a ZOS bug, when sometimes, the end of combat event never triggers as it should when the player dies 
* The out of combat trigger is now slightly postponed, in order to avoid an issue when the combatlog_events are not perfectly synchronized with other combat_events
* The actual combat session also starts when a player enters the game in a middle of a fight (or if the user triggers a reloadUI during combat.)

#### v0.4.7 (McGuffin)
* Fixed a (badly declared) local var that had a bad side effect.

#### v0.4.6 (McGuffin)
* added an option to set critical/tick tag in the combatlog
* the Recount UI should not popup again after a gameUI close if it was hidden before.

#### v0.4.5 (McGuffin)
* Total dps/hps are now computed throught active combat duration.
* Added a timestamp in the combatLog section
* small cleanup

#### v0.4.4 (McGuffin)
* added keybinding for "toggleShow", "reset", and "toggle mode"
* You can scroll over both combat log and skill stats
* fixed scroll limit for skill stats

#### v0.4.3 (McGuffin)
* Recount now hides itself while the player is in game UI (map, inventory etc.)
* You can scroll the statistics bars with the mousewheel on mouseOver (This doesnt work with the combatlog yet, only bars)
* Small code fixes

#### v0.4.2 (McGuffin)
* Recount should now correctly shows/hides itself while in/out combat with the "hide in combat" setting.
* Dps calculation is now more strict and datas are only collected during combat
* Skill Bar refresh is frequency has been reduced and streamlined

#### v0.4.1 (McGuffin)
* added an option in option menu that allows to not show each skill crit/hit statistic
* Self damages (like equilibrium) are now excluded from dps calculation

#### v0.4.0 (McGuffin)
* added critical strikes statistic. Values are separated in each skill for periodic and direct damage/heal.
* default fonts has been reevaluated
* max % of bars now fits the skill that has max value
* fixed some nil errors
* updated last libs

#### v0.3.2 and previous versions (Fayn)