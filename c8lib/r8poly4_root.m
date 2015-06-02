function [ r1, r2, r3, r4 ] = r8poly4_root ( a, b, c, d, e )

%*****************************************************************************80
%
%% R8POLY4_ROOT returns the four roots of a quartic polynomial.
%
%  Discussion:
%
%    The polynomial has the form:
%
%      A * X**4 + B * X**3 + C * X**2 + D * X + E = 0
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
%    Input, real A, B, C, D, the coefficients of the polynomial.
%    A must not be zero.
%
%    Output, complex R1, R2, R3, R4, the roots of the polynomial.
%
  if ( a == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8POLY4_ROOT - Fatal error!\n' );
    fprintf ( 1, '  A must not be zero!\n' );
    error ( 'R8POLY4_ROOT - Fatal error!' );
  end

  a4 = b / a;
  b4 = c / a;
  c4 = d / a;
  d4 = e / a;
%
%  Set the coefficients of the resolvent cubic equation.
%
  a3 = 1.0;
  b3 = -b4;
  c3 = a4 * c4 - 4.0 * d4;
  d3 = -a4 * a4 * d4 + 4.0 * b4 * d4 - c4 * c4;
%
%  Find the roots of the resolvent cubic.
%
  [ r1, r2, r3 ] = r8poly3_root ( a3, b3, c3, d3 );
%
%  Choose one root of the cubic, here R1.
%
%  Set R = sqrt ( 0.25 * A4**2 - B4 + R1 )
%
  r = sqrt ( 0.25 * a4^2 - b4  + r1 );

  if ( r ~= 0.0 )

    p = sqrt ( 0.75 * a4^2 - r^2 - 2.0 * b4 ...
        + 0.25 * ( 4.0 * a4 * b4 - 8.0 * c4 - a4^3 ) / r );

    q = sqrt ( 0.75 * a4^2 - r^2 - 2.0 * b4 ...
        - 0.25 * ( 4.0 * a4 * b4 - 8.0 * c4 - a4^3 ) / r );

  else

    p = sqrt ( 0.75 * a4^2 - 2.0 * b4 + 2.0 * sqrt ( r1^2 - 4.0 * d4 ) );
    q = sqrt ( 0.75 * a4^2 - 2.0 * b4 - 2.0 * sqrt ( r1^2 - 4.0 * d4 ) );

  end
%
%  Set the roots.
%
  r1 = -0.25 * a4 + 0.5 * r + 0.5 * p;
  r2 = -0.25 * a4 + 0.5 * r - 0.5 * p;
  r3 = -0.25 * a4 - 0.5 * r + 0.5 * q;
  r4 = -0.25 * a4 - 0.5 * r - 0.5 * q;

  return
end
