module ItemsHelper
include ActionView::Helpers::DateHelper

  def time_left(item)
    if item.created_at > Time.now - 7.days
      "#{distance_of_time_in_words(7.days.ago, item.created_at)} left"
    else
      "Expired"
    end
  end
end
