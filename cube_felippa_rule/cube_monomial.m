function value = cube_monomial ( a, b, expon )

%*****************************************************************************80
%
%% CUBE_MONOMIAL integrates a monomial over a cube in 3D.
%
%  Discussion:
%
%    This routine integrates a monomial of the form
%
%      product ( 1 <= dim <= 3 ) x(dim)^expon(dim)
%
%    The combination 0^0 should be treated as 1.
%
%    The integration region is:
%      A(1) <= X <= B(1)
%      A(2) <= Y <= B(2)
%      A(3) <= Z <= B(3)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(3), B(3), the lower and upper limits.
%
%    Input, integer EXPON(3), the exponents.
%
%    Output, real VALUE, the integral of the monomial.
%
  for i = 1 : 3

    if ( expon(i) == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'CUBE_MONOMIAL - Fatal error!\n' );
      fprintf ( 1, '  Exponent of -1 encountered.\n' );
      error ( 'CUBE_MONOMIAL - Fatal error!' );
    end

  end

  value = 1.0;

  for i = 1 : 3

    value = value * ( b(i) ^ ( expon(i) + 1 ) - a(i) ^ ( expon(i) + 1 ) ) ...
      / ( expon(i) + 1 );

  end

  return
end
