Function play_episode(episode As Object) as object
  port = CreateObject("roMessagePort")

  screen = CreateObject("roVideoScreen")
  screen.SetCertificatesFile("common:/certs/ca-bundle.crt")
  screen.AddHeader("X-Roku-Reserved-Dev-Id", "")
  screen.InitClientCertificates()
  screen.SetContent(episode)
  screen.SetMessagePort(Port)
  screen.show()

  while(true)
    msg = wait(0, port)
    if msg.isScreenClosed()
      return -1
    endif
  end while

End Function
