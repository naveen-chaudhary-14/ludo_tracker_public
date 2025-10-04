module HomepageHelper
  def player_title(position)
    case position
    when 0
      "Ser"
    when 1
      "Knight"
    when 2
      "Squire"
    else
      "Page"
    end
  end
end
