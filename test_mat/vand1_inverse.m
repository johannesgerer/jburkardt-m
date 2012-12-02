function a = vand1_inverse ( n, x )

%*****************************************************************************80
%
%% VAND1_INVERSE returns the inverse of the Vandermonde1 matrix.
%
%  Formula:
%
%    A(I,J) = coefficient of X**(J-1) in I-th Lagrange basis polynomial.
%
%  Example:
%
%    N = 5, 
%    X = ( 2, 3, 4, 5, 6 )
%
%     15.00  -14.25    4.96  -0.75   0.04
%    -40.00   44.67  -17.33   2.83  -0.17
%     45.00  -54.00   22.75  -4.00   0.25
%    -24.00   30.00  -13.33   2.50  -0.17
%      5.00   -6.42    2.96  -0.58   0.04
%
%  Properties:
%
%    The sum of the entries of A is
%
%      1 - product ( 1 <= I <= N ) ( 1 - 1 / X(I) ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix desired.
%
%    Input, real X(N), the values that define A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n
      if ( j == 1 )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end
    end
  end

  for i = 1 : n

    index = 0;

    for k = 1 : n

      if ( k ~= i )

        index = index + 1;

        for j = index + 1: - 1 : 1

          a(i,j) = - x(k) * a(i,j) / ( x(i) - x(k) );

          if ( 1 < j )
            a(i,j) = a(i,j) + a(i,j-1) / ( x(i) - x(k) );
          end

        end

      end

    end

  end

  return
end
