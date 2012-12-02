function [ r1, r2 ] = r8poly2_rroot ( a, b, c )

%*****************************************************************************80
%
%% R8POLY2_RROOT returns the real parts of the roots of a quadratic polynomial.
%
%  Example:
%
%    A    B    C       roots              R1   R2
%   --   --   --     ------------------   --   --
%    1   -4    3     1          3          1    3
%    1    0    4     2*i      - 2*i        0    0
%    2   -6    5     3 +   i    3 -   i    3    3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, the coefficients of the quadratic
%    polynomial A * X**2 + B * X + C = 0 whose roots are desired.
%    A must not be zero.
%
%    Output, real R1, R2, the real parts of the roots
%    of the polynomial.
%
  if ( a == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8POLY2_RROOT - Fatal error!\n' );
    fprintf ( 1, '  The coefficient A is zero.\n' );
    error ( 'R8POLY2_RROOT - Fatal error!' );
  end

  disc = b * b - 4.0 * a * c;
  disc = max ( disc, 0.0 );

  q = ( b + r8_sign ( b ) * sqrt ( disc ) );
  r1 = -0.5 * q / a;
  r2 = -2.0 * c / q;

  return
end
