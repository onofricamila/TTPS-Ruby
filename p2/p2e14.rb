# 14. Boolean opposite

module Opposite
    def opposite
        !self
    end
end

class TrueClass
    include Opposite
end

class FalseClass
    include Opposite
end


p "true.opposite --> #{true.opposite}"
p "false.opposite --> #{false.opposite}"
p "true.opposite.opposite --> #{true.opposite.opposite}"
p "false.opposite.opposite --> #{false.opposite.opposite}"

# NOTA: "The global value true is the only instance of class TrueClass and represents a logically true value in boolean expressions.
# The class provides operators allowing true to be used in logical expressions."
# Same w false and FalseClass.
