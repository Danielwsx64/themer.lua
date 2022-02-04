local base = {
  base00 = "#2E3440",
  base01 = "#3B4252",
  base02 = "#434C5E",
  base03 = "#4C566A",
  base04 = "#D8DEE9",
  base05 = "#E5E9F0",
  base06 = "#ECEFF4",
  base07 = "#8FBCBB",
  base08 = "#88C0D0",
  base09 = "#81A1C1",
  base0A = "#88C0D0",
  base0B = "#A3BE8C",
  base0C = "#81A1C1",
  base0D = "#81A1C1",
  base0E = "#81A1C1",
  base0F = "#B48EAD",
  white = "#abb2bf",
  darker_black = "#2a303c",
  black = "#2E3440", --  nvim bg
  black2 = "#343a46",
  one_bg = "#373d49",
  one_bg2 = "#464c58",
  one_bg3 = "#494f5b",
  grey = "#4b515d",
  grey_fg = "#565c68",
  grey_fg2 = "#606672",
  light_grey = "#646a76",
  red = "#BF616A",
  baby_pink = "#de878f",
  pink = "#d57780",
  line = "#3a404c", -- for lines like vertsplit
  green = "#A3BE8C",
  vibrant_green = "#afca98",
  blue = "#7797b7",
  nord_blue = "#81A1C1",
  yellow = "#EBCB8B",
  sun = "#e1c181",
  purple = "#aab1be",
  dark_purple = "#B48EAD",
  teal = "#6484a4",
  orange = "#e39a83",
  cyan = "#9aafe6",
  statusline_bg = "#333945",
  lightbg = "#3f4551",
  lightbg2 = "#393f4b",
  pmenu_bg = "#A3BE8C",
  folder_bg = "#7797b7",
}

local cp = {
  -- Legacy colors for compatibility
  red = base.red,
  yellow = base.yellow,
  orange = base.orange,
  magenta = base.dark_purple,
  blue = base.blue,
  green = base.green,
  cyan = base.teal,

  -- The new shiny boy
  directory = base.folder_bg,
  fg = base.white,
  diff = {
    add = base.green,
    remove = base.red,
    text = base.blue,
    change = base.yellow,
  },
  accent = base.base0C,
  search_result = { fg = base.base01, bg = base.base0A, telescope = base.base0A },
  match = base.base06,
  dimmed = {
    inactive = base.base03,
    subtle = base.grey_fg,
  },
  bg = {
    base = base.base00,
    alt = base.darker_black,
    selected = base.base02,
  },
  border = base.blue,
  syntax = {
    statement = base.base08,
    ["function"] = base.base0D,
    variable = base.base05,
    include = base.base0D,
    keyword = base.base0E,
    struct = base.base0E,
    string = base.base0B,
    identifier = base.base08,
    field = base.base08,
    parameter = base.base08,
    property = base.base08,
    punctuation = base.base0F,
    constructor = base.base0C,
    operator = base.base05,
    preproc = base.base0A,
    constant = base.base09,
    todo = { fg = base.base0A, bg = base.base01 },
    number = base.base09,
    comment = base.base03,
    type = base.base0A,
    conditional = base.base0E,
  },
  built_in = {
    ["function"] = base.base0C,
    type = base.base0A,
    variable = base.base0C,
    keyword = base.base0E,
    constant = base.base09,
  },
  diagnostic = {
    error = base.red,
    warn = base.yellow,
    info = base.green,
    hint = base.purple,
  },
  inc_search = { fg = base.base01, bg = base.base09 },
  uri = base.base08,
  pum = {
    fg = base.base06,
    bg = base.one_bg,
    sbar = base.one_bg2,
    thumb = base.nord_blue,
    sel = {
      bg = base.pmenu_bg,
      fg = base.base05,
    },
  },
  heading = {
    h1 = base.blue,
    h2 = base.blue,
  },
}

return cp
