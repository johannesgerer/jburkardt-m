function [ r1, r2, r3 ] = r8poly3_root ( a, b, c, d )

%*****************************************************************************80
%
%% R8POLY3_ROOT returns the three roots of a cubic polynomial.
%
%  Discussion:
%
%    The polynomial has the form
%
%      A * X**3 + B * X**2 + C * X + D = 0
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
%    Output, complex R1, R2, R3, the roots of the polynomial, which
%    will include at least one real root.
%
  if ( a == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8POLY3_ROOT - Fatal error!\n' );
    fprintf ( 1, '  A must not be zero!\n' );
    error ( 'R8POLY3_ROOT - Fatal error!' );
  end

  i = sqrt ( -1.0 );

  q = ( ( b / a )^2 - 3.0 * ( c / a ) ) / 9.0;

  r = ( 2.0 * ( b / a )^3 - 9.0 * ( b / a ) * ( c / a ) ...
      + 27.0 * ( d / a ) ) / 54.0;

  if ( r * r < q * q * q )

    theta = acos ( r / sqrt ( q^3 ) );
    r1 = -2.0 * sqrt ( q ) * cos (   theta              / 3.0 );
    r2 = -2.0 * sqrt ( q ) * cos ( ( theta + 2.0 * pi ) / 3.0 );
    r3 = -2.0 * sqrt ( q ) * cos ( ( theta + 4.0 * pi ) / 3.0 );

  elseif ( q * q * q <= r * r )

    temp = -r + sqrt ( r^2 - q^3 );
    s1 = r8_sign ( temp ) * ( abs ( temp ) )^(1.0/3.0);

    temp = -r - sqrt ( r^2 - q^3 );
    s2 = r8_sign ( temp ) * ( abs ( temp ) )^(1.0/3.0);

    r1 = s1 + s2;
    r2 = -0.5 * ( s1 + s2 ) + i * 0.5 * sqrt ( 3.0 ) * ( s1 - s2 );
    r3 = -0.5 * ( s1 + s2 ) - i * 0.5 * sqrt ( 3.0 ) * ( s1 - s2 );

  end

  r1 = r1 - b / ( 3.0 * a );
  r2 = r2 - b / ( 3.0 * a );
  r3 = r3 - b / ( 3.0 * a );

  return
end
