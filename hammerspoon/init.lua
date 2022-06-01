-- https://johngrib.github.io/wiki/hammerspoon/
-- https://www.hammerspoon.org/go/

-- functions for open application
function openEditor()
	hs.application.launchOrFocus('CotEditor')
end

function openTerm()
	hs.application.launchOrFocus('iTerm')
end

hs.hotkey.bind({'ctrl'}, 't', openTerm)
hs.hotkey.bind({'ctrl'}, 'e', openEditor)
