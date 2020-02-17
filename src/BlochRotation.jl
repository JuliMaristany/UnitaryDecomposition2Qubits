using LinearAlgebra
include("Pauli.jl")

function BlochRotation(axis,phase)


#Axis is the axis of rotation, should be a 1x3 array. It is not normalized,
#therefore being axis=angle*axis
#phase is the general phase

p=[Pauli(1), Pauli(2), Pauli(3)]
a=axis

exp(-phase*im)exp(-(p[1]*axis[1]+p[2]*a[2]+p[3]*a[3])/2*im)

end
