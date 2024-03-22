return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		local db = require("dashboard")

		local header = {
			"",
			"",
			"888888888888888888888888888888888888888888888888888888888888888888888888888",
			"8888.._|      | `-.  | `.  -_-_ _-_  _-  _- -_ -  .'|   |.'|     |  _..8888",
			"8888   `-.._  |    |`!  |`.  -_ -__ -_ _- _-_-  .'  |.;'   |   _.!-'|  8888",
			"8888      | `-!._  |  `;!  ;. _______________ ,'| .-' |   _!.i'     |  8888",
			"8888..__  |     |`-!._ | `.| |_______________||.\"'|  _!.;'   |     _|..8888",
			"8888   |``\"..__ |    |`\";.| i|_|MMMMMMMMMMM|_|'| _!-|   |   _|..-|'    8888",
			"8888   |      |``--..|_ | `;!|l|MMoMMMMoMMM|1|.'j   |_..!-'|     |     8888",
			"8888   |      |    |   |`-,!_|_|MMMMP'YMMMM|_||.!-;'  |    |     |     8888",
			"8888___|______|____!.,.!,.!,!|d|MMMo * loMM|p|,!,.!.,.!..__|_____|_____8888",
			"8888      |     |    |  |  | |_|MMMMb,dMMMM|_|| |   |   |    |      |  8888",
			"8888      |     |    |..!-;'i|r|MPYMoMMMMoM|r| |`-..|   |    |      |  8888",
			"8888      |    _!.-j'  | _!,\"|_|M<>MMMMoMMM|_||!._|  `i-!.._ |      |  8888",
			"8888     _!.-'|    | _.\"|  !;|1|MbdMMoMMMMM|l|`.| `-._|    |``-.._  |  8888",
			"8888..-i'     |  _.''|  !-| !|_|MMMoMMMMoMM|_|.|`-. | ``._ |     |``\"..8888",
			'8888   |      |.|    |.|  !| |u|MoMMMMoMMMM|n||`. |`!   | `".    |     8888',
			"8888   |  _.-'  |  .'  |.' |/|_|MMMMoMMMMoM|_|! |`!  `,.|    |-._|     8888",
			"8888  _!\"'|     !.'|  .'| .'|[@]MMMMMMMMMMM[@] \\|  `. | `._  |   `-._  8888",
			"8888-'    |   .'   |.|  |/| /                 \\|`.  |`!    |.|      |`-8888",
			"8888      |_.'|   .' | .' |/                   \\  \\ |  `.  | `._-   |  8888",
			"8888     .'   | .'   |/|  /                     \\ |`!   |`.|    `.  |  8888",
			"8888  _.'     !'|   .' | /                       \\|  `  |  `.    |`.|  8888",
			"888888888888888888888888888888888888888888888888888888888888888888888888888",
			"",
		}

		db.setup({
			theme = "hyper",
			config = {
				header = header,
				shortcut = {
					{ desc = "💫 Update", group = "@property", action = "Lazy update", key = "u" },
					{
						icon = "📑 ",
						icon_hl = "@variable",
						desc = "Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
				},
				projects = {
					enable = true,
					limit = 8,
				},
			},
		})

		vim.keymap.set("n", "<leader>ad", "<Cmd>Dashboard<CR>")
	end,
}
