function value = square_monomial ( a, b, expon )

%*****************************************************************************80
%
%% SQUARE_MONOMIAL integrates a monomial over a square in 2D.
%
%  Discussion:
%
%    This routine integrates a monomial of the form
%
%      product ( 1 <= dim <= 2 ) x(dim)^expon(dim)
%
%    where the exponents are nonnegative integers.  Note that
%    if the combination 0^0 is encountered, it should be treated
%    as 1.
%
%    The integration region is defined as:
%      A(1) <= X <= B(1)
%      A(2) <= Y <= B(2)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(2), B(2), the lower and upper limits.
%
%    Input, integer EXPON(2), the exponents.
%
%    Output, real VALUE, the integral of the monomial.
%
  for i = 1 : 2

    if ( expon(i) == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SQUARE_MONOMIAL - Fatal error!\n' );
      fprintf ( 1, '  Exponent of -1 encountered.\n' );
      error ( 'SQUARE_MONOMIAL - Fatal error!' );
    end

  end

  value = 1.0;

  for i = 1 : 2

    value = value * ( b(i) ^ ( expon(i) + 1 ) - a(i) ^ ( expon(i) + 1 ) ) ...
      / ( expon(i) + 1 );

  end

  return
end
