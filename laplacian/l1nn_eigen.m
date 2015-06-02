function [ v, lambda ] = l1nn_eigen ( n, h )

%*****************************************************************************80
%
%% L1NN_EIGEN returns eigeninformation for the 1D NN Laplacian.
%
%  Discussion:
%
%    The grid points are assumed to be evenly spaced by H.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 October 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real H, the spacing between points.
%
%    Output, real V(N,N), the eigenvectors.
%
%    Output, real LAMBDA(N), the eigenvalues.
%
  v = zeros ( n, n );
  lambda = zeros ( n, 1 );

  for j = 1 : n
    theta = pi * ( j - 1.0 ) / ( 2.0 * n );
    lambda(j) = 4.0 * ( sin ( theta ) / h ) ^ 2;
    if ( j == 1 )
      for i = 1 : n
        v(i,j) = sqrt ( n );
      end
    else
      for i = 1 : n
        theta = pi * ( i - 0.5 ) * ( j - 1.0 ) / n;
        v(i,j) = sqrt ( 2.0 / n ) * cos ( theta );
      end
    end
  end

  return
end
