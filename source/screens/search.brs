Function search_screen() as object
  ggaa = GetGlobalAA()
  m.config = ggaa.config

  screen = CreateObject("roKeyboardScreen")
  port = CreateObject("roMessagePort")
  screen.SetMessagePort(port)

  screen.SetTitle(m.config.search_title)
  screen.SetDisplayText(m.config.search_help_text)
  screen.AddButton(1, m.config.search_button_text)

  screen.show()

  while (true)

    msg = wait(0, port)
    if type(msg) = "roKeyboardScreenEvent"
      if (msg.isScreenClosed())
        return -1
      else if msg.isButtonPressed()
        if msg.GetIndex() = 1
          search_results_screen(screen.GetText())
        endif
      endif
    endif
  end while
End Function