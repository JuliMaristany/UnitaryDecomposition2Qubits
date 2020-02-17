
function Pauli(i)

if i==0

return [1.0 0.0; 0.0 1.0]

elseif i==1

return [0.0 1.0; 1.0 0.0]

elseif i==2

return [0. -1.0im; 1.0im 0.0]

elseif i==3

return [1.0 0.0 ; 0.0 -1.0]

else throw(DomainError())

end

end
