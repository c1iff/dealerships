class Vehicle
  @@all = []

  attr_reader(:make, :model, :year)
  define_method(:initialize) do |attributes|
    @make = attributes.fetch(:make)
    @model = attributes.fetch(:model)
    @year = attributes.fetch(:year)
  end

  define_singleton_method(:clear) do
    @@all = []
  end

  define_singleton_method(:all) do
    @@all
  end

  define_method(:save) do
    @@all.push(self)
  end

  define_method(:age) do
    Time.now.year.-(@year.to_i)
  end

  define_method(:worth_buying?) do
    american_cars = ["Chrysler", "Ford", "GM"]
    american_cars.include?(@make).&(age().<=(15))
  end
end
