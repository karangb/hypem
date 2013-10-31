class MyObject < JSONable
  def initialize a=[1,2,3], b='hello'
    @a = a
    @b = b
  end
end

describe "JSONable objects" do
  it "can be converted into json" do
    MyObject.new.to_json.should == "{\"@a\":[1,2,3],\"@b\":\"hello\"}"    
  end
end

