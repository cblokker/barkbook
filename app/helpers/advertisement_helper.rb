module AdvertisementHelper
  def render_ad?(index, frequency)
    index != 0 && index % frequency == 0
  end
end
