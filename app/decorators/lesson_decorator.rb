class LessonDecorator < Draper::Decorator
  delegate_all

  def price
    return '無料' if !object.price || object.price <= 0
    object.price.to_i.to_currency + '円'
  end
end
