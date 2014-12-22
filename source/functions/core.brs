'core "business logic" functionality goes here

Function call_api(url As String) as Object
  request = CreateObject("roUrlTransfer")
  port = CreateObject("roMessagePort")
  request.SetPort(port)

  request.SetCertificatesFile("common:/certs/ca-bundle.crt")
  request.AddHeader("X-Roku-Reserved-Dev-Id", "")
  request.InitClientCertificates()

  request.SetUrl(url)

  if(request.AsyncGetToString())
    while(true)
      msg = wait(0, port)
      if(type(msg) = "roUrlEvent")
        code = msg.GetResponseCode()
        if(code = 200)
          res = ParseJSON(msg.GetString())
          return res.response
        endif
      else if(event = invalid)
        request.AsyncCancel()
      endif
    end while
  endif

  return invalid
End Function
