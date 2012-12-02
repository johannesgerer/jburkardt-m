function [ r1, r2 ] = r8poly2_root ( a, b, c )

%*****************************************************************************80
%
%% R8POLY2_ROOT returns the two roots of a quadratic polynomial.
%
%  Discussion:
%
%    The polynomial has the form:
%
%      A * X**2 + B * X + C = 0 
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
%    Input, real A, B, C, the coefficients of the polynomial.
%    A must not be zero.
%
%    Output, complex R1, R2, the roots of the polynomial, which
%    might be real and distinct, real and equal, or complex conjugates.
%
  if ( a == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8POLY2_ROOT - Fatal error!\n' );
    fprintf ( 1, '  The coefficient A is zero.\n' );
    error ( 'R8POLY2_ROOT - Fatal error!' );
  end

  disc = b * b - 4.0 * a * c;
  q = -0.5 * ( b + r8_sign ( b ) * sqrt ( disc ) );
  r1 = q / a;
  r2 = c / q;

  return
end
