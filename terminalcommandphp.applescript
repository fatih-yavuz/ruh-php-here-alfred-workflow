on run theQuery
	
	tell application "Finder"
		
		try
			set targetFolder to (folder of front window as alias)
		on error
			set targetFolder to (path to desktop folder)
		end try
		
		if (theQuery as string) is not "" then
			set targetPath to targetFolder
			set targetPath to (the POSIX path of targetFolder)
			set targetPath to "'" & targetPath & (theQuery as string) & ".php'"
			set theCommand to "php " & targetPath
		else
			set theCommand to "php " & targetPath
		end if
		
	end tell
	
	tell application "Terminal"
		activate
		set terminalWindow to ""
		
		if (count of windows) is greater than 0 then
			repeat with theWindow in windows
				if theWindow is not busy then
					set terminalWindow to theWindow
					set frontmost of terminalWindow to true
					exit repeat
				end if
			end repeat
		end if
		
		if terminalWindow is not "" then
			do script theCommand in terminalWindow
		else
			do script theCommand
		end if
		
	end tell
	
end run