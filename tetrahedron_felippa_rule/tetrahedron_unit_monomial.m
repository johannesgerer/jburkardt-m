function value = tetrahedron_unit_monomial ( expon )

%*****************************************************************************80
%
%% TETRAHEDRON_UNIT_MONOMIAL integrates a monomial over the unit tetrahedron.
%
%  Discussion:
%
%    This routine integrates a monomial of the form
%
%      product ( 1 <= dim <= 3 ) x(dim)^expon(dim)
%
%    where the exponents are nonnegative integers.  Note that
%    if the combination 0^0 is encountered, it should be treated
%    as 1.
%
%    Integral ( over unit tetrahedron ) x^l y^m z^n dx dy =
%    l% * m% * n% / ( m + n + 3 )%
%
%    The integration region is defined as:
%
%      0 <= X
%      0 <= Y
%      0 <= Z
%      0 <= X + Y + Z <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2009
%
%  Author:
%
%    John Burkardt
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
%
%  The first loop simply calculates 1, so we short circuit it.
%
% k = 0;
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

  for i = 1 : expon(3)
    k = k + 1;
    value = value * i / k;
  end

  k = k + 1;
  value = value / k;

  k = k + 1;
  value = value / k;

  k = k + 1;
  value = value / k;

  return
end
