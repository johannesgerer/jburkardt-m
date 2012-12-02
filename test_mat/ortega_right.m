function x = ortega_right ( n, u, v, d )

%*****************************************************************************80
%
%% ORTEGA_RIGHT returns the (right) eigenvectors of the ORTEGA matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    James Ortega,
%    Generation of Test Matrices by Similarity Transformations,
%    Communications of the ACM,
%    Volume 7, 1964, pages 377-378.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    2 <= N.
%
%    Input, real U(N), V(N), vectors which define the matrix.
%    U'V must not equal -1.0.  If, in fact, U'V = 0, and U, V and D are
%    integers, then the matrix, inverse, eigenvalues, and eigenvectors 
%    will be integers.
%
%    Input, real D(N), the desired eigenvalues.
%
%    Output, real X(N,N), the determinant.
%
  x = zeros(n,n);

  for j = 1 : n
    for i = 1 : n

      if ( i == j )
        x(i,j) = 1.0 + u(i) * v(j);
      else
        x(i,j) =       u(i) * v(j);
      end

    end
  end

  return
end
