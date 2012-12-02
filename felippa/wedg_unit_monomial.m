function value = wedg_unit_monomial ( expon )

%*****************************************************************************80
%
%% WEDG_UNIT_MONOMIAL: monomial integral in a unit wedge.
%
%  Discussion:
%
%    This routine returns the integral of
%
%      product ( 1 <= I <= 3 ) X(I)^EXPON(I)
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
%    Input, integer EXPON(3), the exponents.
%
%    Output, real VALUE, the integral of the monomial.
%

%
%  The first computation ends with VALUE = 1.0;
%
  value = 1.0;

% k = 0;
%
%  The first loop simply computes 1 so we short circuit it%
%
% for i = 1 : expon(1)
%   k = k + 1;
%   value = value * i / k;
% end

  k = expon(1);

  for i = 1 : expon(2)
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
  if ( expon(3) == - 1 )
    fprintf ( 1, '\n' ); 
    fprintf ( 1, 'WEDG_UNIT_MONOMIAL\n' );
    fprintf ( 1, '  EXPON(3) = -1 is not a legal input.\n' );
    error ( 'WEDG_UNIT_MONOMIAL - Fatal error!' );
  elseif ( mod ( expon(3), 2 ) == 1 )
    value = 0.0;
  else
    value = value * 2.0 / ( expon(3) + 1 );
  end

  return
end
