$ ->
  $('.comments_interface').on 'click', '.hide-comment', ->
    $.ajax $(this).data('comment_endpoint'),
      type: 'PUT'
      data: comment: hidden: $(this).val()

  $('.comments_interface').on 'click', '.resolve-comment', ->
    $.ajax $(this).data('comment_endpoint'),
      type: 'PUT'
      data: comment: resolved: $(this).val()
