function value = simplex_unit_monomial_int ( dim_num, expon )

%*****************************************************************************80
%
%% SIMPLEX_UNIT_MONOMIAL_INT integrates a monomial over a simplex.
%
%  Discussion:
%
%    This routine evaluates a monomial of the form
%
%      product ( 1 <= dim <= dim_num ) x(dim)^expon(dim)
%
%    where the exponents are nonnegative integers.  Note that
%    if the combination 0^0 is encountered, it should be treated
%    as 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 July 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer EXPON(DIM_NUM), the exponents.
%
%    Output, real VALUE, the value of the integral of the
%    monomial.
%

%
%  The first computation ends with VALUE = 1.0;
%
  value = 1.0;

  k = 0;

  for dim = 1 : dim_num

    for i = 1 : expon(dim)
      k = k + 1;
      value = value * i / k;
    end

  end

  for dim = 1 : dim_num

    k = k + 1;
    value = value / k;

  end

  return
end
