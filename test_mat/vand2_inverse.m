function a = vand2_inverse ( n, x )

%*****************************************************************************80
%
%% VAND2_INVERSE returns the inverse of the Vandermonde2 matrix.
%
%  Formula:
%
%    A(I,J) = coefficient of X**(I-1) in J-th Lagrange basis polynomial.
%
%  Example:
%
%    N = 5, X = ( 2, 3, 4, 5, 6 )
%
%     15.00  -40.00   45.00  -24.00   5.00
%    -14.25   44.67  -54.00   30.00  -6.42
%      4.96  -17.33   22.75  -13.33   2.96
%     -0.75    2.83   -4.00    2.50  -0.58
%      0.04   -0.17    0.25   -0.17   0.04
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2007
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
      if ( i == 1 )
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

        for j = index + 1 : - 1 : 1

          a(j,i) = - x(k) * a(j,i) / ( x(i) - x(k) );

          if ( 1 < j )
            a(j,i) = a(j,i) + a(j-1,i) / ( x(i) - x(k) );
          end

        end

      end

    end

  end

  return
end
