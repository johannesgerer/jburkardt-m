function value = monomial_int01 ( dim_num, expon )

%*****************************************************************************80
%
%% MONOMIAL_INT01 returns the integral of a monomial over the [0,1] hypercube.
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
%    11 November 2007
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
%    monomial over the [0,1] hypercube.
%
  value = 1.0 / prod ( expon(1:dim_num) + 1 );

  return
end
