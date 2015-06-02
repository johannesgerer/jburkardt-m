function value = daub6_condition ( n )

%*****************************************************************************80
%
%% DAUB6_DETERMINANT returns the L1 condition of the DAUB6 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real VALUE, the L1 condition.
%
  c0 =  1.0 + sqrt ( 10.0 ) ...
    +             sqrt ( 5.0 + sqrt ( 40.0 ) );
  c1 =  5.0 + sqrt ( 10.0 ) ...
    +   3.0 * sqrt ( 5.0 + sqrt ( 40.0 ) );
  c2 = 10.0 - sqrt ( 40.0 ) ...
    +   2.0 * sqrt ( 5.0 + sqrt ( 40.0 ) );
  c3 = 10.0 - sqrt ( 40.0 ) ...
    -   2.0 * sqrt ( 5.0 + sqrt ( 40.0 ) );
  c4 =  5.0 + sqrt ( 10.0 ) ...
    -   3.0 * sqrt ( 5.0 + sqrt ( 40.0 ) );
  c5 =  1.0 + sqrt ( 10.0 ) ...
    -             sqrt ( 5.0 + sqrt ( 40.0 ) );

  c0 = c0 / sqrt ( 512.0 );
  c1 = c1 / sqrt ( 512.0 );
  c2 = c2 / sqrt ( 512.0 );
  c3 = c3 / sqrt ( 512.0 );
  c4 = c4 / sqrt ( 512.0 );
  c5 = c5 / sqrt ( 512.0 );

  a_norm = abs ( c0 ) + abs ( c1 ) ...
         + abs ( c2 ) + abs ( c3 ) ...
         + abs ( c4 ) + abs ( c5 );
  b_norm = a_norm;
  value = a_norm * b_norm;

  return
end
