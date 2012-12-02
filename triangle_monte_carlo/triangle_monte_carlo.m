function [ result, seed ] = triangle_monte_carlo ( t, p_num, f_num, ...
  triangle_unit_sample, triangle_integrand, seed )

%*****************************************************************************80
%
%% TRIANGLE_MONTE_CARLO applies the Monte Carlo rule to integrate a function.
%
%  Discussion:
%
%    The function f(x,y) is to be integrated over a triangle T.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%
%    Input, integer P_NUM, the number of sample points.
%
%    Input, integer F_NUM, the number of functions to integrate.
%
%    Input, external TRIANGLE_UNIT_SAMPLE, the sampling routine.
%
%    Input, external TRIANGLE_INTEGRAND, the integrand routine.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real RESULT(F_NUM), the approximate integrals.
%
  area = triangle_area ( t );

  [ p, seed ] = triangle_unit_sample ( p_num, seed );

  p2 = reference_to_physical_t3 ( t, p_num, p );

  fp = triangle_integrand ( p_num, p2, f_num );

  result = zeros ( f_num, 1 );
  
  for i = 1 : f_num
    result(i) = area * sum ( fp(i,1:p_num) ) / p_num;
  end

  return
end
