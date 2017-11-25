function testSVD(X)
%% using SVD
[U,S,V] = svd(X);

%U is an m x m unitary matrix

%S is a diagonal m x n matrix with non-negative real numbers on the
%diagonal (singular values of the matrix 
%a.k.a square roots of eigenvals of (X^*)X)

%V is an n x n unitary matrix over K, and

%V^* is the conjugate transpose of V.

isX = U*S*ctranspose(V); %ctranspose is command for conjugate transpose (^*)

%% psuedoinverse M^+=VSU^*, 
%pinv(matrix) is moore-pennrose psudo inverse 
pinvInverse = pinv(X);
%find new S by hand
InverseUsingSVD = V*pinv(S)*ctranspose(U);

%% The right-singular vectors corresponding to vanishing singular values of
%M span the null space of M and the left-singular vectors corresponding to 
%the non-zero singular values of M span the range of M. E.g., in the above 
%example the null space is spanned by the last two columns of V and the 
%range is spanned by the first three columns of U

% the rank of X is the number of non-zero diagonal entries of S
rank = length(diag(S));
d = diag(S);
for i = 1:length(diag(S))
    if .0000001 >= abs(d(i))
        rank = rank - 1;
    end
end
rank
%% Low-rank matrix approximation

%In the case that the approximation is based on minimizing the Frobenius norm
%of the difference between M and Mapprox under the constraint that 
%rank(Mapprox)=r. it turns out that the solution is given by the SVD of M, namely
%Mapprox=(U)(Sapprox)(V^*)
%where Sapprox  is the same matrix as S except that it contains only the r 
%largest singular values
r = 1;
Sapprox = zeros(size(S));
Sapprox(:,r) = S(:,r);
Xapprox = U*Sapprox*ctranspose(V);

%% Eigenvalue Decomposition

%(X^*)(X) = (V)(S^*)(U^*)(U)(S)(V^*)   
%(X)(X^*) = (U)(S)(V^*)(V)(S^*)(U^*)

%The columns of V (right-singular vectors) are eigenvectors of (M^*)(M).
%The columns of U (left-singular vectors) are eigenvectors of (M)(M^*).
%The non-zero elements of S (non-zero singular values) are the square 
%roots of the non-zero eigenvalues of (M^*)(M) or (M)(M^*).

ctransposeXX = V*ctranspose(S)*ctranspose(U)*U*S*ctranspose(V);
[vecs,vals] = eig(ctransposeXX)
XctransposeX = U*S*ctranspose(V)*V*ctranspose(S)*ctranspose(U);
[vecs,vals] =eig(XctransposeX)

end