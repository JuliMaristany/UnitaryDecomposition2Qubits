module UnitaryDecomposition

using LinearAlgebra
using Optim

include("Pauli.jl")
include("BlochRotation.jl")
include("BasicGates.jl")

export Udecompose

#This code will decompose an unitary into blocks of single qubit rotations
#and cnots between adjacent qubits

function U(n,p,nq)
Ut=1
for i=1:nq
 Ut=kron(Ut,BlochRotation(n[i,:],p[i]))
end
for j=0:nq-2
  Ut=Ut*kron(Diagonal(ones(2^j)),CNOT12,Diagonal(ones(2^(nq-j-2))))
end
return Ut
end

function Utestlist(U)
# U will have to have the form [n[,] a[] p[] nq]
# Only leave U[i] on the non fixed parameters, and fix the ones I want
  n=[U[1] U[2] U[3]; U[4] U[5] U[6]] # This depends on nq
  p=[U[7] U[8]]
  nq=2 #usually fixed, never optimize over nq
  return Utest(n,p,nq)
end


function UDecompose(U,N)
#U is the unitary we want to decompose
#N is the number of blocks we want
f(x)=norm(U-Ublock(N)(x))
nq=2
x0=rand(N,4*nq)
res=optimize(f,x0)
return res.minimizer, res.minimum
end

function Ublock(N)
# N is the number of layers
if N==1
return Utestlist
end
#if N==2
#Ublock2(U)=Utestlist(U[1,:])*Utestlist(U[2,:])
#return Ublock2
#end
if N>1
Ub(U)=Utestlist(U[1,:])*Ublock(N-1)(U[2:end,:])
end
end

end
