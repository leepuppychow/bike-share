RSpec.describe Station do 
  describe "Validations" do 
    it "is invalid without a name" do 
      station = Station.new(dock_count: 2, city: "SF", installation_date: "10-20-2013")

      expect(station).to be_invalid
    end 
    it "is invalid without a dock_count" do 
      station = Station.new(name: "Mission", city: "SF", installation_date: "10-20-2013")
      
      expect(station).to be_invalid
    end 
    it "is invalid without a city" do 
      station = Station.new(name: "Mission", dock_count: 5, installation_date: "10-20-2013")
      
      expect(station).to be_invalid
    end 
     it "is invalid without a installation_date" do 
      station = Station.new(name: "Mission", dock_count: 5, city: "SF")
      
      expect(station).to be_invalid
    end 
  end
end