class Dessert
  attr_accessor :name
  attr_accessor :calories
  def initialize(name, calories)
    @name=name
    @calories=calories
  end
  def healthy?
    return (calories<200)? true:false
  end
  def delicious?
    return true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor
  def initialize(flavor)
    @flavor=flavor
    super(flavor+" jelly bean",5)
  end
  def delicious?
      return (flavor=="licorice")? false:true
  end
end
