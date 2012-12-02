function value = monomial_integral_legendre ( dim_num, expon )

%*****************************************************************************80
%
%% MONOMIAL_INTEGRAL_LEGENDRE integrates a Legendre monomial.
%
%  Discussion:
%
%    This routine returns the exact value of a multidimensional Legendre
%    type integral:
%
%      integral ( -1 <= x(1:n) <= +1 ) f(x) dx
%
%    where f(x) is a monomial of the form:
%
%      product ( 1 <= dim <= dim_num ) x(dim)^expon(dim)
%
%    and the exponents are nonnegative integers.  Note that the combination
%    0^0 is treated as 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    30 March 2008
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
  if ( any ( mod ( expon(1:dim_num), 2 ) == 1 ) )
    value = 0.0;
  else
    value = 2.0^dim_num / prod ( expon(1:dim_num) + 1 );
  end

  return
end
