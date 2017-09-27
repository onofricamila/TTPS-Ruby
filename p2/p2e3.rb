#   3. Suponé que se te da el método que implementaste en el ejercicio anterior para que lo
#   uses a fin de ordenar un arreglo de números que te son provistos en forma de arreglo.
#   ¿Cómo podrías invocar el método? Por ejemplo, teniendo la siguiente variable con los
#   números a ordenar:


def ordenar *nums
    nums.sort
end

# Lo invocaria haciendo 
entrada = [10, 9, 1, 2, 3, 5, 7, 8]
ordenar *entrada