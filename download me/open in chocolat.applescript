-- Opens the currently selected Finder files, or else the current Finder window, in Chocolat. Also handles dropped files and folders.

-- Original (for TextMate) by Henrik Nyh <http://henrik.nyh.se>
-- Adapted to BBEdit by Dr. Drang <http://leancrew.com>
-- Based loosely on http://snippets.dzone.com/posts/show/1037
-- Adapted once again by Pirijan Ketheswaran <http://pketh.org>

-- script was clicked
on run
  activate application "System Events"
  activate application "Finder"
  tell application "Finder"
    if selection is {} then
      set finderSelection to folder of the front window as string
    else
      set finderSelection to selection as alias list
    end if
  end tell

  choc(finderSelection)
end run

-- script was drag-and-dropped onto
on open (theList)
  choc(theList)
end open

-- open in Chocolat
on choc(listOfAliases)
  tell application "Chocolat"
    open listOfAliases
    activate
  end tell
end choc
