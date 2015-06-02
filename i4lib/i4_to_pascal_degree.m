function d = i4_to_pascal_degree ( k )

%*****************************************************************************80
%
%% I4_TO_PASCAL_DEGREE converts a linear index to a Pascal triangle degree.
%
%  Discussion:
%
%    We describe the grid points in Pascal's triangle in two ways:
%
%    As a linear index K:
%
%                     1
%                   2   3
%                 4   5   6
%               7   8   9   10
%
%    As elements (I,J) of Pascal's triangle:
%
%                     0,0
%                  1,0   0,1
%               2,0   1,1    0,2
%            3,0   2,1   1,2    0,3
%
%    The quantity D represents the "degree" of the corresponding monomial,
%    that is, D = I + J.
%
%    We can compute D directly from K using the quadratic formula.
%
%  Example:
%
%     K  I  J  D
%
%     1  0  0  0
%
%     2  1  0  1
%     3  0  1  1
%
%     4  2  0  2
%     5  1  1  2
%     6  0  2  2
%
%     7  3  0  3
%     8  2  1  3
%     9  1  2  3
%    10  0  3  3
%
%    11  4  0  4
%    12  3  1  4
%    13  2  2  4
%    14  1  3  4
%    15  0  4  4
%
%    16  5  0  5
%    17  4  1  5
%    18  3  2  5
%    19  2  3  5
%    20  1  4  5
%    21  0  5  5
%
%    22  6  0  6
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer K, the linear index of the (I,J) element.
%    1 <= K.
%
%    Output, integer D, the degree (sum) of the corresponding Pascal indices.
%
  if ( k <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_TO_PASCAL_DEGREE - Fatal error!\n' );
    fprintf ( 1, '  K must be positive.\n' );
    error ( 'I4_TO_PASCAL_DEGREE - Fatal error!' );
  end

  d = floor ( 0.5 * ( -1.0 + sqrt ( 1.0 + 8.0 * ( k - 1 ) ) ) );

  return
end
