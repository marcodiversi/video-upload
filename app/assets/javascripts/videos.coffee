$ ->
  for video in $('.video-full, .video-thumb')
    window.pubnub.subscribe
      channel: 'video.' + $(video).attr('data-video-id')
      message: (msg, env, chan) ->
        id = chan.split('.')[1]
        switch msg.event
          when 'published'
            location.reload()
          when 'liked'
            console.log('liked')
            for likes in $("[data-video-id=" + id + "]").find('.likes-count')
              console.log('add')
              $(likes).html(parseInt($(likes).html()) + 1)
          when 'disliked'
            console.log('disliked')
            for likes in $("[data-video-id=" + id + "]").find('.likes-count')
              console.log('remove')
              $(likes).html(parseInt($(likes).html()) - 1)