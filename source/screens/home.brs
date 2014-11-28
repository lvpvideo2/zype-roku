Function home_screen()
  screen = CreateObject("roGridScreen")
  port = CreateObject("roMessagePort")
  screen.SetMessagePort(port)

  screen.SetBreadcrumbText(m.config.home_name, "")
  screen.setGridStyle(m.config.grid_layout)
  screen.SetDisplayMode(m.config.scale_mode)

  featured = get_featured_playlist()
  categories = get_category_playlists()
  toolbar = grid_toolbar()
  
  names = CreateObject("roArray", 1, true)
  names.push(featured.name)
  for each category in categories
    names.push(category.name)
  end for
  names.push(toolbar.name)

  screen.SetupLists(names.count())
  screen.SetListNames(names)

  screen.SetContentList(0, featured.episodes)

  i = 1
  for each category in categories
    screen.SetContentList(i, category.episodes)
    i = i+1
  end for

  screen.SetContentList(i, toolbar.tools)

  screen.SetFocusedListItem(0,0)
  screen.show()

  while(true)
    msg = wait(0, port)
    if type(msg) = "roGridScreenEvent"
      if (msg.isListItemSelected())
        if(msg.GetIndex() = 0)
          detail_screen(featured.episodes[msg.GetData()], featured.name, "")
        else if(msg.GetIndex() = names.count()-1)
          toolbar.tools[msg.GetData()].function_name()
        else
          detail_screen(categories[msg.GetIndex()-1].episodes[msg.GetData()], categories[msg.GetIndex()-1].name, "")
        endif
      endif
    endif
  end while

End Function