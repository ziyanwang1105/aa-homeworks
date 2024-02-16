require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:brownie) { Dessert.new("brownie", 100, chef) }

  describe "#initialize" do
    it "sets a type"
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity"
      expect(brownie.quantity).to eq(100)
    end

    it "starts ingredients as an empty array"
      expect(brownie.ingredients.length).to eq(0)
    end

    it "raises an argument error when given a non-integer quantity"
      expect(Dessert.new("cake", "1", chef)).to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array"
      brownie.add_ingredient("flour")
      expect(brownie.ingredients).to include("flour")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array"
      stuff = ["flour", "chocolate", "egg", "sugar", "butter", "coco powder"]
      stuff.each do |ele|
        brownie.add_ingredient(ele)
      end
      expect(bronwie.ingredients).to eq(stuff)
      brownie.mix!
      expect(brownie.ingredients).not_to eq(stuff)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity"
      bronwie.eat(10)
      expect(brownie.quantity). to eq(90)
    end

    it "raises an error if the amount is greater than the quantity"
      expect{brownie.eat(200)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
      allow(chef).to receive(:titleize).and_return("Chef Wang")
      expect(brownie.serve).to eq("Chef Wang has made 100 brownies!")
    end
  end


  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
