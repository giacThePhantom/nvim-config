local ls = require 'luasnip'
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt


local tex_utils = {}
tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function()  -- comment detection
  return vim.fn['vimtex#syntax#in_comment']() == 1
end
tex_utils.in_env = function(name)  -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function()  -- equation environment detection
    return tex_utils.in_env('equation')
end
tex_utils.in_itemize_or_enumerate = function()  -- itemize environment detection
    return tex_utils.in_env('itemize') or tex_utils.in_env('enumerate')
end
tex_utils.in_tikz = function()  -- TikZ picture environment detection
    return tex_utils.in_env('tikzpicture')
end



ls.add_snippets("tex", {
    ls.snippet(
      {
        trig = "item",
        descr = "Itemize list"
      },
      fmt(
      [[
        \begin{{itemize}}
          \item {}
        \end{{itemize}}
      ]],
      {i(1)}
      )
    ),

    ls.snippet(
      {
        trig = "enum",
        descr = "Enumerate list"
      },
      fmt(
      [[
        \begin{{enumerate}}
          \item {}
        \end{{enumerate}}
      ]],
      {i(1)}
      )
    ),

    ls.snippet(
      {
        trig = "t",
        descr = "itemize"
      },
      fmt("\\item{}",
      {i(1)}
      ),
      {condition = tex_utils.in_itemize_or_enumerate }
    ),

    ls.snippet(
      {
        trig = "menum",
        descr = "Multicolumn enumerate list"
      },
      fmt(
      [[
        \begin{{multicols}}{{2}}
          \begin{{enumerate}}
            \item {}
          \end{{enumerate}}
        \end{{multicols}}
      ]],
      {i(1)}
      )
    ),

    ls.snippet(
      {
        trig = "mitem",
        descr = "Multicolumn itemize list"
      },
      fmt(
      [[
        \begin{{multicols}}{{2}}
          \begin{{itemize}}
            \item {}
          \end{{itemize}}
        \end{{multicols}}
      ]],
      {i(1)}
      )
    ),

    ls.snippet(
      {
        trig = "f",
        descr = "Fraction"
      },
      fmt("\\frac{{{}}}{{{}}}",
      {i(1), i(2)}
      ),
      {condition = tex_utils.in_mathzone }
    ),

    ls.snippet(
      {
        trig = "v",
        descr = "Vector"
      },
      fmt("\\vec{{{}}}",
      {i(1)}
      ),
      {condition = tex_utils.in_mathzone }
    ),

    ls.snippet(
      {
        trig = "d",
        descr = "Derivative"
      },
      fmt("\\frac{{d{}}}{{d{}}}",
      {i(1), i(2)}
      ),
      {condition = tex_utils.in_mathzone }
    ),

    ls.snippet(
      {
        trig = "pd",
        descr = "Partial Derivative"
      },
      fmt("\\frac{{\\partial {}}}{{\\partial {}}}",
      {i(1), i(2)}
      ),
      {condition = tex_utils.in_mathzone }
    ),

    ls.snippet(
      {
        trig = "lim",
        descr = "Limit"
      },
      fmt("\\lim\\limits_{{{}\\rightarrow{}}}",
      {i(1), i(2)}
      ),
      {condition = tex_utils.in_mathzone }
    ),

    ls.snippet(
      {
        trig = "sum",
        descr = "Sum"
      },
      fmt("\\sum\\limits^{{{}}}_{{{}}}",
      {i(1), i(2)}
      ),
      {condition = tex_utils.in_mathzone }
    ),

    ls.snippet(
      {
        trig = "prod",
        descr = "Prod"
      },
      fmt("\\prod\\limits^{{{}}}_{{{}}}",
      {i(1), i(2)}
      ),
      {condition = tex_utils.in_mathzone }
    ),

    ls.snippet(
      {
        trig = "^",
        descr = "Exponent"
      },
      fmt("^{{{}}}",
      {i(1)}
      ),
      {condition = tex_utils.in_mathzone }
    ),

    ls.snippet(
      {
        trig = "_",
        descr = "Exponent"
      },
      fmt("_{{{}}}",
      {i(1)}
      ),
      {condition = tex_utils.in_mathzone }
    ),

    ls.snippet(
      {
        trig = "l",
        descr = "Prefix for parenthesis"
      },
      t("\\left"),
      {condition = tex_utils.in_mathzone }
    ),

    ls.snippet(
      {
        trig = "c",
        descr = "Calligraphy"
      },
      fmt("\\mathcal{{{}}}",
        {i(1)}
      ),
      {condition = tex_utils.in_mathzone }
    ),

    ls.snippet(
      {
        trig = "b",
        descr = "Math Number sets"
      },
      fmt("\\mathbb{{{}}}",
        {i(1)}
      ),
      {condition = tex_utils.in_mathzone }
    ),

  }
)
