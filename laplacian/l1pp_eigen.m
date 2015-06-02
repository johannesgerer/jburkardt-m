function [ v, lambda ] = l1pp_eigen ( n, h )

%*****************************************************************************80
%
%% L1PP_EIGEN returns eigeninformation for the 1D PP Laplacian.
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

    if ( mod ( j, 2 ) == 1 )
      theta = pi * ( j - 1.0 ) / ( 2.0 * n );
    else
      theta = pi *   j        / ( 2.0 * n );
    end
    lambda(j) = 4.0 * ( sin ( theta ) / h ) ^ 2;

    if ( mod ( j, 2 ) == 1 )
      if ( j == 1 )
        for i = 1 : n
          v(i,j) = 1.0 / sqrt ( n );
        end
      else
        for i = 1 : n
          theta = pi * ( i - 0.5 ) * ( j - 1.0 ) /  n;
          v(i,j) = sqrt ( 2.0 / n ) * cos ( theta );
        end
      end
    else
      if ( j == n )
        s = - 1.0 / sqrt ( n );
        for i = 1 : n
          v(i,j) = s;
          s = - s;
        end
      else
        for i = 1 : n
          theta = pi * ( i - 0.5 ) * j / n;
          v(i,j) = sqrt ( 2.0 / n ) * sin ( theta );
        end
      end
    end

  end

  return
end
