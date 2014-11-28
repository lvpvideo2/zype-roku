Function grid_toolbar() as object
  toolbar = {name: m.config.toolbar_title, tools: []}
  toolbar.tools = [
    {
      Title: m.config.search_title,
      SDPosterUrl: m.images.search_poster_sd,
      HDPosterUrl: m.images.search_poster_hd,
      Description: m.config.search_description,
      function_name: search_screen
    },
    {
      Title: m.config.info_title,
      SDPosterUrl: m.images.info_poster_sd,
      HDPosterUrl: m.images.info_poster_hd,
      Description: m.config.info_description,
      function_name: info_screen
    },
  ]
  return toolbar
End Function