-- local status, _ = pcall(vim.cmd, "colorscheme nightfly")
-- local status, _ = pcall(vim.cmd, "colorscheme tokyonight-moon")
-- local status, _ = pcall(vim.cmd, "colorscheme catppuccin")
-- if not status then
--	print("Colorscheme not found! File ~ .coloscheme")
--	return
-- end


local M = {}
M.colours = {
	blue = "#65D1FF",
	green = "#3EFFDC",
	greenAlt = "#1D9983",
	violet = "#FF61EF",
	yellow = "#FFDA7B",
	black = "#000000",
	orange = "#ffae57",
	red = "#e06c75",
}

M.program_colours = {
	zsh = "#428850",
	astro = M.colours.orange,
	c = "#519aba",
	css = "#61afef",
	deb = "#a1b7ee",
	docker = "#384d54",
	html = "#de8c92",
	jpeg = "#c882e7",
	jpg = "#c882e7",
	js = "#ebcb8b",
	jsx = "#519ab8",
	kt = "#7bc99c",
	lock = "#c4c720",
	lua = "#51a0cf",
	mp3 = "#d39ede",
	mp4 = "#9ea3de",
	out = "#abb2bf",
	png = "#c882e7",
	py = "#a3b8ef",
	rb = "#ff75a0",
	robots = "#abb2bf",
	rpm = "#fca2aa",
	rs = "#dea584",
	toml = "#39bf39",
	ts = "#519aba",
	ttf = "#abb2bf",
	vue = "#7bc99c",
	woff = "#abb2bf",
	woff2 = "#abb2bf",
	zip = "#f9d71c",
	php = "#8993be",
}

return M
