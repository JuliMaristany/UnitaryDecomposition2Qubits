using LinearAlgebra
include("Pauli.jl")
include("BlochRotation.jl")

Hadammard = [ 1  1 ; 1 -1 ];
CNOT12= [1 0 0 0; 0 1 0 0; 0 0 0 1; 0 0 1 0];
