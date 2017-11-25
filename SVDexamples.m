function testSVD(X)
%% using SVD
[U,S,V] = svd(X);

%U is an m × m unitary matrix 

%S is a diagonal m × n matrix with non-negative real numbers on the
%diagonal (singular values of the matrix 
%a.k.a square roots of eigenvals of (X^*)X)

%V is an n × n unitary matrix over K, and

%V^* is the conjugate transpose of V.

isX = U*S*ctranspose(V) %ctranspose is command for conjugate transpose (^*)

%% psuedoinverse M^+=VSU^*, 
%pinv(matrix) is moore-pennrose psudo inverse 
pinvInverse = pinv(X)
InverseUsingSVD = V*pinv(S)*ctranspose(U)

%% The right-singular vectors corresponding to vanishing singular values of
%M span the null space of M and the left-singular vectors corresponding to 
%the non-zero singular values of M span the range of M. E.g., in the above 
%example the null space is spanned by the last two columns of V and the 
%range is spanned by the first three columns of U

% the rank of X is the number of non-zero diagonal entries of S
rank = length(diag(S))
end