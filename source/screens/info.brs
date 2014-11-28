Function info_screen() as object
  ggaa = GetGlobalAA()
  m.config = ggaa.config

  screen = CreateObject("roParagraphScreen")
  port = CreateObject("roMessagePort")
  screen.SetMessagePort(port)

  screen.SetBreadcrumbText(m.config.info_title, "")

  screen.AddHeaderText(m.config.info.header)
  for each paragraph in m.config.info.paragraphs
    screen.AddParagraph(paragraph)
  end for
  
  screen.show()

  while (true)
    msg = wait(0, port)
    if type(msg) = "roParagraphScreenEvent"
      if (msg.isScreenClosed())
        return -1
      endif
    endif
  end while
End Function