'initialization functions

'master initialization function
Function init() as void
  set_api()
  get_dynamic_config()
  init_theme()
End Function

'pull and setup configuration from api
Function get_dynamic_config() as void
  url = m.api.endpoint + "/app/?api_key=" + m.api.key + "&app_key=" + m.api.app
  res = call_api(url)
  m.config = res
  m.config.per_page = Str(m.config.per_page).Trim()
  m.config.info = {
        header: "About Zype Media"
        paragraphs: [
            "NEXT GENERATION ONLINE VIDEO PLATFORM FOR DESTINATIONS & APPS",
            "",
            "Our platform includes everything you need to create immersive video experiences to drive revenue and reach.",
            "",
            "http://www.zype.com"
        ]
    }
  cache_images(m.config.app_images)
End Function

'cache theme images in temporary storage
Function cache_images(images As Object) as void
  cached_images = CreateObject("roAssociativeArray")
  for each image in images
    for each key in image
      if image[key] = invalid
      else
        print "caching: " + image[key]
        file = "tmp:/" + key + ".png"
        ut = CreateObject("roUrlTransfer")
        ut.SetUrl(image[key])
        responseCode = ut.GetToFile(file)
        if responseCode = 200
          cached_images[key] = file
          print "success"
        end if
      end if
    end for
  end for
  m.images = cached_images
End Function

'initialize the theme variables
Function init_theme() as void
  app = CreateObject("roAppManager")
  theme={
    'colors
    BackgroundColor: m.config.color_background,
    CounterSeparator: m.config.color_dark,
    CounterTextLeft: m.config.color_dark,
    CounterTextRight: m.config.color_dark,
    BreadcrumbTextLeft: m.config.color_light,
    BreadcrumbTextRight: m.config.color_light,
    BreadcrumbDelimiter: m.config.color_light,
    SpringboardActorColor: m.config.color_muted,
    SpringboardGenreColor: m.config.color_muted,
    SpringboardRuntimeColor: m.config.color_muted,
    SpringboardSynopsisColor: m.config.color_dark,
    SpringboardTitleText: m.config.color_dark,
    ButtonMenuHighlightText: m.config.color_brand,
    ButtonMenuNormalText: m.config.color_muted,
    ButtonHighlightColor: m.config.color_brand,
    ButtonMenuNormalOverlayText: m.config.color_brand,
    ButtonNormalColor: m.config.color_muted,
    EpisodeSynopsisText: m.config.color_dark,
    PosterScreenLine1Text: m.config.color_dark,
    PosterScreenLine2Text: m.config.color_muted,
    ParagraphBodyText: m.config.color_muted,
    ParagraphHeaderText: m.config.color_dark,
    GridScreenBackgroundColor: m.config.color_background,
    GridScreenListNameColor: m.config.color_dark,
    GridScreenDescriptionDateColor: m.config.color_muted,
    GridScreenDescriptionRuntimeColor: m.config.color_muted,
    GridScreenDescriptionSynopsisColor: m.config.color_dark,
    GridScreenDescriptionTitleColor: m.config.color_dark,

    'images
    OverhangSliceHD: m.images.slice_hd,
    OverhangPrimaryLogoHD: m.images.logo_hd,
    OverhangSliceSD: m.images.slice_sd,
    OverhangPrimaryLogoSD: m.images.logo_sd,
    GridScreenDescriptionImageHD: m.images.grid_description_image_hd,
    GridScreenDescriptionImageSD: m.images.grid_description_image_sd,
    GridScreenFocusBorderHD: m.images.grid_border_image_hd,
    GridScreenFocusBorderSD: m.images.grid_border_image_sd,
    GridScreenOverhangSliceHD: m.images.slice_hd
    GridScreenLogoHD: m.images.logo_hd,
    GridScreenOverhangSliceSD: m.images.slice_sd,
    GridScreenLogoSD: m.images.logo_sd,

    'offsets
    OverhangPrimaryLogoOffsetHD_X: m.config.logo_offset_hd_x,
    OverhangPrimaryLogoOffsetHD_Y: m.config.logo_offset_hd_y,
    OverhangPrimaryLogoOffsetSD_X: m.config.logo_offset_sd_x,
    OverhangPrimaryLogoOffsetSD_Y: m.config.logo_offset_sd_y,
    GridScreenDescriptionOffsetHD: m.config.grid_description_image_offset_hd,
    GridScreenDescriptionOffsetSD: m.config.grid_description_image_offset_sd,
    GridScreenBorderOffsetHD: m.config.grid_border_offset_hd,
    GridScreenOverhangHeightHD: m.config.grid_overhang_height_hd,
    GridScreenOverhangHeightSD: m.config.grid_overhang_height_sd,
    GridScreenLogoOffsetHD_X: m.config.grid_logo_offset_hd_x,
    GridScreenLogoOffsetHD_Y: m.config.grid_logo_offset_hd_y,
    GridScreenLogoOffsetSD_X: m.config.grid_logo_offset_sd_x,
    GridScreenLogoOffsetSD_Y: m.config.grid_logo_offset_sd_y
  }

  print theme
  app.SetTheme(theme)
end Function
