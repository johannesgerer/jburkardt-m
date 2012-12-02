function value = monomial_integral_laguerre ( dim_num, expon )

%*****************************************************************************80
%
%% MONOMIAL_INTEGRAL_LAGUERRE integrates a Laguerre monomial.
%
%  Discussion:
%
%    L(1,n) = Integral ( 0 <= x < Infinity ) x^n exp ( -x ) dx
%           = n!
%
%    L(d,n) = Integral ( 0 <= x(i) < Infinity ) 
%             x1^n1 * x2^n2...*xd^nd * exp(-x1-x2...-xd ) dx
%           = Product ( n(i)! ).
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
%    Output, real VALUE, the value of the integral.
%
  value = 1.0;
  for dim = 1 : dim_num
    value = value * r8_factorial ( expon(dim) ) ;
  end

  return
end
