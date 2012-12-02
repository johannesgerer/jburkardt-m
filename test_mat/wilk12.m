function a = wilk12 ( )

%*****************************************************************************80
%
%% WILK12 returns the WILK12 matrix.
%
%  Formula:
%
%    12 11  0  0  0  0  0  0  0  0  0  0
%    11 11 10  0  0  0  0  0  0  0  0  0
%    10 10 10  9  0  0  0  0  0  0  0  0
%     9  9  9  9  8  0  0  0  0  0  0  0
%     8  8  8  8  8  7  0  0  0  0  0  0
%     7  7  7  7  7  7  6  0  0  0  0  0
%     6  6  6  6  6  6  6  5  0  0  0  0
%     5  5  5  5  5  5  5  5  4  0  0  0
%     4  4  4  4  4  4  4  4  4  3  0  0
%     3  3  3  3  3  3  3  3  3  3  2  0
%     2  2  2  2  2  2  2  2  2  2  2  1
%     1  1  1  1  1  1  1  1  1  1  1  1
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    det ( A ) = 1.
%
%    A is lower Hessenberg.
%
%    The smaller eigenvalues are very ill conditioned.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    James Wilkinson,
%    Rounding Errors in Algebraic Processes,
%    Prentice Hall, 1963,
%    page 151.
%
%  Parameters:
%
%    Output, real A(12,12), the matrix.
%
  n = 12;

  for i = 1 : n
    for j = 1 : n

      if ( j <= i + 1 )
        a(i,j) = n + 1 - max ( i, j );
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
