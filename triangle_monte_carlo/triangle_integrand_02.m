function fp = triangle_integrand_02 ( p_num, p, f_num )

%*****************************************************************************80
%
%% TRIANGLE_INTEGRAND_02 evaluates 2 integrand functions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer P_NUM, the number of points.
%
%    Input, real P(2,P_NUM), the evaluation points.
%
%    Input, integer F_NUM, the number of integrands.
%
%    Output, real FP(F_NUM,P_NUM), the integrand values.
%
  fp = zeros ( 2, p_num );

  fp(1,1:p_num) = p(1,1:p_num);
  fp(2,1:p_num) = p(2,1:p_num);

  return
end
