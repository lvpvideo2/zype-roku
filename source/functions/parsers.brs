'parsers are helper functions that parse results out of api responses

Function parse_thumbnail(input As Object) as string
  thumbnail_url = ""
  for each  thumbnail in input.thumbnails
    if(thumbnail.DoesExist("height"))
      if(thumbnail.height >= 250)
        thumbnail_url = thumbnail.url
        return thumbnail_url
      endif
    endif
  end for
  return thumbnail_url
End Function

Function parse_rating(input As Object) as string
  rating = "NR"
  if(input.DoesExist("categories"))
    for each category in input.categories
      if(category.DoesExist("title"))
        if(category.title = "rating")
          rating = UCase(category.value[0])
          return rating
        endif
      endif
    end for
  endif
  return rating
End Function

Function parse_zobjects(input As Object, ztype as String) as Object
  zobjects = CreateObject("roArray", 1, true)
    if(input.DoesExist("video_zobjects"))
      for each zobject in input.video_zobjects
        if(zobject.DoesExist("zobject_type_title"))
        print zobject.zobject_type_title
        print ztype
        print " "
          if(zobject.zobject_type_title = ztype)
            zobjects.push(zobject.title)
          endif
        endif
      end for
    endif
  return zobjects
End Function