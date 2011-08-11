require File.join(File.dirname(__FILE__),"spec_helper")

describe "ActiveRecord plurals plugin" do
  class Mountain < ActiveRecord::Base;end

  before(:all){setup_schema}
  after (:all){teardown_schema}
  
  before :each do
    stubs = [ Mountain.new(:name => "Kilimanjaro", :country => "Tanzania"),
              Mountain.new(:name => "Everest",     :country => "Nepal")   ]
    Mountain.stub!(:select).and_return(stubs)
    Mountain.stub!(:all).and_return(stubs)
  end
    
  it "should get an array of all the model's attribute values" do
    Mountain.names.should == ["Kilimanjaro", "Everest"]
  end

  it "should get an array of attribute values from an array of activerecord instances" do
    Mountain.all.countries.should == ["Tanzania", "Nepal"]
  end

  it "should respond to plural methods on the ActiveRecord class" do
    [:ids, :names, :countries, :created_ats].each{ |method| Mountain.should respond_to method}
  end

  it "should respond to plural methods on an array of ActiveRecord instances" do
    [:ids, :names, :countries, :created_ats].each{ |method| Mountain.all.should respond_to method}
  end

end
