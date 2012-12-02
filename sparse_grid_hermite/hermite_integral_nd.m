function value = hermite_integral_nd ( dim_num, expon )

%*****************************************************************************80
%
%% HERMITE_INTEGRAL_ND evaluates a multidimensional Hermite polynomial integral.
%
%  Discussion:
%
%    H(d,n) = Integral ( -Infinity < x < Infinity ) 
%      x1^n1 * x2^n2...*xd^nd * exp(-x1^2-x2^2...-xd^2 ) dx
%
%    H(d,n) is 0 if any n(i) odd.
%
%    H(d,n) = product ( 1 <= i <= d ) 
%      ( (n(i)-1)!! * sqrt(pi) / 2^(n(i)/2) for all n(i) even.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    08 October 2007
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
  if ( any ( expon(1:dim_num) < 0 ) )

    value = - Inf;

  elseif ( any ( mod ( expon(1:dim_num), 2 ) == 1 ) )

    value = 0.0;

  else

    value = 1.0;
    for dim = 1 : dim_num
      value = value * r8_factorial2 ( expon(dim) - 1 ) * sqrt ( pi ) ...
        / 2.0^( expon(dim) / 2 );
    end
    
  end

  return
end
