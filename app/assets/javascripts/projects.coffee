$ ->
  $('.project-list').on 'click', '.project-completion', ->
    completion_data = {}
    completion_data[$(this).data('element_class')] = done: $(this).prop('checked')
    $.ajax $(this).data('element_endpoint'),
      type: 'PUT'
      data: completion_data
    return
  return
