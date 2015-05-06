$(window).on( 'load page:load', ->
  $('.js-btn-confirm').on( 'click', ->
    return confirm( '本当に実行してもよろしいですか？' )
  )
)

@confirmDisable = ->
  confirm( '無効化してもよろしいですか？' )
@confirmDelete = ->
  confirm( '削除してもよろしいですか？\n(※ この操作は取り消せません。)' )
@confirmLock = ->
  confirm( 'ロックしてもよろしいですか？' )
@confirmCancel = ->
  confirm( '取消してもよろしいですか？' )

@setConfirmation = ->
  $('.js-btn-lock').on( 'click', confirmLock )
  $('.js-btn-delete').on( 'click', confirmDelete )
  $('.js-btn-disable').on( 'click', confirmDisable )
  $('.js-btn-cancel').on( 'click', confirmCancel )

$(window).on( 'load page:load', ->
  setConfirmation()
)

$.fn.modal.Constructor.DEFAULTS.keyboard = false
$.fn.modal.Constructor.DEFAULTS.backdrop = 'static'
