require('rspec')
require('dealerships')
require('vehicles')

describe (Dealership) do
   before() do
     Dealership.clear()
   end

  describe('#name') do
    it("returns the name of the dealership") do
      test_name = Dealership.new("Tonya's Used Cars")
      expect(test_name.name()).to(eq("Tonya's Used Cars"))
    end
  end

  describe(".all") do
    it("returns the dealership array") do
      expect(Dealership.all).to(eq([]))
    end
  end

  describe("#id") do
    it("returns the id of the dealership") do
      test_dealership = Dealership.new("Tonya's Used Cars")
      expect(test_dealership.id()).to(eq(1))
    end
  end

  describe("#save") do
    it("saves the dealership to the array") do
      test_dealership = Dealership.new("Barbara's Used Cars")
      test_dealership.save()
      expect(Dealership.all).to(eq([test_dealership]))
    end
  end

  describe(".clear") do
    it("it clears the dealership array") do
      test_dealership = Dealership.new("Linda's Used Cars").save()
      Dealership.clear()
      expect(Dealership.all).to(eq([]))
    end
  end

  describe(".find") do
    it("returns the name of the dealership based on its unique id") do
      test_deal1 = Dealership.new("Barbara's Used Cars")
      test_deal1.save()
      test_deal2 = Dealership.new("Frank's Used Cars")
      test_deal2.save()
      expect(Dealership.find(test_deal1.id())).to(eq(test_deal1))
    end
  end

  describe('#add_vehicle') do
    it("adds a new vehicle to a dealership") do
      test_dealership = Dealership.new("Bob's Used Cars")
      test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
      test_dealership.add_vehicle(test_vehicle)
      expect(test_dealership.cars()).to(eq([test_vehicle]))
    end
  end


end
