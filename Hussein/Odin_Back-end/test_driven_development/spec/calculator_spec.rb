require "./lib/calculator.rb"

describe Calculator do
    describe "#add" do
        it "returns sum of two numbers" do
            calculator = Calculator.new
            expect(calculator.add(5, 2)).to eql(7)
        end
    end
    describe "#sub" do
        it "returns diff of two numbers" do
            calculator = Calculator.new
            expect(calculator.sub(5,2)).to eql(3)
        end
    end
end
