module DogsHelper
  def list_of_sorting_methods
    {
      "Name" => "order_by_name",
      "Most Liked" => "order_by_most_liked",
      "Most Liked in Last Hour" => "order_by_most_liked_in_last_hour"
    }
  end
end
