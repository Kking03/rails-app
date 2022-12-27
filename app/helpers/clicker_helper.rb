module ClickerHelper
  def level_up?(score, level)
    return (score >= (4*level)**2)
  end
end
