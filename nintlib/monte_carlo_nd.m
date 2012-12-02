function [ result, seed ] = monte_carlo_nd ( func, dim_num, a, b, eval_num, ...
  seed )

%*****************************************************************************80
%
%% MONTE_CARLO_ND estimates a multidimensional integral using Monte Carlo.
%
%  Discussion:
%
%    Unlike the other routines, this routine requires the user to specify
%    the number of function evaluations as an INPUT quantity.  
%    No attempt at error estimation is made.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Dover, 2007,
%    ISBN: 0486453391,
%    LC: QA299.3.D28.
%
%  Parameters:
%
%    Input, function FUNC ( DIM_NUM, X ), the name of the function to be evaluated.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real A(DIM_NUM), B(DIM_NUM), the integration limits.
%
%    Input, integer EVAL_NUM, the number of function evaluations.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real RESULT, the approximate value of the integral.
%
%    Output, integer SEED, a seed for the random number generator.
%
  result = 0.0;
  
  rand ( 'state', seed );
  
  for i = 1 : eval_num

    x = rand ( 1, dim_num );
%   [ x, seed ] = r8vec_uniform_01 ( dim_num, seed );

    result = result + feval ( func, dim_num, x );

  end

  volume = prod ( b(1:dim_num) - a(1:dim_num) );

  result = result * volume / eval_num;

  return
end
