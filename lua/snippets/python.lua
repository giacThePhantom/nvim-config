local ls = require 'luasnip'
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt






ls.add_snippets("python", {
    ls.snippet(
      {
        trig = "np",
        descr = "import numpy"
      },
      fmt(
      [[
        import numpy as np
      ]],
      {}
      )
    ),

    ls.snippet(
      {
        trig = "pd",
        descr = "import pandas"
      },
      fmt(
      [[
        import pandas as pd
      ]],
      {}
      )
    ),

    ls.snippet(
      {
        trig = "plt",
        descr = "import matplotlib.pyplot"
      },
      fmt(
      [[
        import matplotlib.pyplot as plt
      ]],
      {}
      )
    ),

    ls.snippet(
      {
        trig = "fi",
        descr = "for in"
      },
      fmt(
      [[
        for {} in {}:
          {}
      ]],
      {i(1), i(2), i(3)}
      )
    ),

    ls.snippet(
      {
        trig = "fr",
        descr = "for range"
      },
      fmt(
      [[
        for {} in range({}):
          {}
      ]],
      {i(1), i(2), i(3)}
      )
    ),

    ls.snippet(
      {
        trig = "def",
        descr = "function"
      },
      fmt(
      [[
        def {}({}):
          {}
      ]],
      {i(1), i(2), i(3)}
      )
    ),

    ls.snippet(
      {
        trig = "cdef",
        descr = "class method"
      },
      fmt(
      [[
        def {}(self, {}):
          {}
      ]],
      {i(1), i(2), i(3)}
      )
    ),

    ls.snippet(
      {
        trig = "init",
        descr = "class constructor"
      },
      fmt(
      [[
        def __init__(self, {}):
          {}
      ]],
      {i(1), i(2)}
      )
    ),

    ls.snippet(
      {
        trig = "main",
        descr = "class constructor"
      },
      fmt(
      [[
        if __name__ == "__main__":
          {}
      ]],
      {i(1)}
      )
    ),

    ls.snippet(
      {
        trig = "s",
        descr = "self"
      },
      fmt(
      [[
        self.{}
      ]],
      {i(1)}
      )
    ),

  }
)
