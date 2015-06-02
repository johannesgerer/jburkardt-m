function value = wedge_integral ( e )

%*****************************************************************************80
%
%% WEDGE_INTEGRAL: monomial integral in a unit wedge.
%
%  Discussion:
%
%    This routine returns the integral of
%
%      product ( 1 <= I <= 3 ) X(I)^E(I)
%
%    over the unit wedge.
%
%    The integration region is defined as:
%
%      0 <= X
%      0 <= Y
%      X + Y <= 1
%      -1 <= Z <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971,
%    ISBN: 0130438936,
%    LC: QA311.S85.
%
%  Parameters:
%
%    Input, integer E(3), the exponents.
%
%    Output, real VALUE, the integral of the monomial.
%
  value = 1.0;

  k = e(1);

  for i = 1 : e(2)
    k = k + 1;
    value = value * i / k;
  end

  k = k + 1;
  value = value / k;

  k = k + 1;
  value = value / k;
%
%  Now account for integration in Z.
%
  if ( e(3) == - 1 )
    fprintf ( 1, '\n' ); 
    fprintf ( 1, 'WEDGE_INTEGRAL\n' );
    fprintf ( 1, '  E(3) = -1 is not a legal input.\n' );
    error ( 'WEDGE_INTEGRAL - Fatal error!' );
  elseif ( mod ( e(3), 2 ) == 1 )
    value = 0.0;
  else
    value = value * 2.0 / ( e(3) + 1 );
  end

  return
end
