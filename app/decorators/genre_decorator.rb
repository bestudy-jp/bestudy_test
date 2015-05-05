class GenreDecorator < Draper::Decorator
  delegate_all

  def name_with_parent
    return parent_genre.decorate.name_with_parent + ' > ' + name if parent_genre
    name
  end
end
