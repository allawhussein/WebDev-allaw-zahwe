require "yaml"

class DAT_A
    def initialize(string, number)
        @string = string
        @number = number
    end

    def to_s
        "In A:\n\    #{@string}, #{@number}\n"#tabs are not allowed in yaml
    end
end

class DAT_B
    def initialize(number, a_object)
        @number = number
        @a_object = a_object
    end

    def to_s
        "In B: #{@number} \n    #{@a_object.to_s}\n"
    end
end

class DAT_C
    def initialize(b_object, a_object)
        @b_object = b_object
        @a_object = a_object
    end

    def to_s
        "In C:\n #{@a_object} #{@b_object}\n"
    end
end

a = DAT_A.new("hussein", 18)
b = DAT_B.new(7, a)
c = DAT_C.new(b, a)

puts c

serilized_object = YAML::dump(c)
puts serilized_object
puts YAML::load(serilized_object)