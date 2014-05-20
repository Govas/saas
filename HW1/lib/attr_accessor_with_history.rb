class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name + "_history" # create bar_history getter
    @old=nil
    class_eval %Q{
     def #{attr_name}=(attr_name)
     @#{attr_name+"_history"}=[] if @#{attr_name+"_history"} == nil
     @#{attr_name+"_history"}<<@old
     @#{attr_name}=attr_name
     @old=attr_name
     end
    }
  end
end