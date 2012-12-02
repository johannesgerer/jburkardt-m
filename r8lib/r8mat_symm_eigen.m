function a = r8mat_symm_uniform ( n, x, q )

%*****************************************************************************80
%
%% R8MAT_SYMM_EIGEN returns a symmetric matrix with given eigensystem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N), the desired eigenvalues for the matrix.
%
%    Input, real Q(N,N), the orthogonal eigenvector matrix of A.
%
%    Output, real A(N,N), a random symmetric N by N matrix with
%    eigenvalues X and eigenvectors the columns of Q.
%

%
%  Set A = Q * Lambda * Q'.
%
  a(1:n,1:n) = 0.0;

  for i = 1 : n
    for j = 1 : n
      for k = 1 : n
        a(i,j) = a(i,j) + q(i,k) * x(k) * q(j,k);
      end
    end
  end

  return
end
