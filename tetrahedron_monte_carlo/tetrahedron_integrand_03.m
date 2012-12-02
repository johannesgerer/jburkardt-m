function fp = tetrahedron_integrand_03 ( p_num, p, f_num )

%*****************************************************************************80
%
%% TETRAHEDRON_INTEGRAND_03 evaluates 6 integrand functions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer P_NUM, the number of points.
%
%    Input, real P(3,P_NUM), the evaluation points.
%
%    Input, integer F_NUM, the number of integrands.
%
%    Output, real FP(F_NUM,P_NUM), the integrand values.
%
  fp = zeros ( f_num, p_num );

  fp(1,1:p_num) = p(1,1:p_num) .* p(1,1:p_num);
  fp(2,1:p_num) = p(1,1:p_num) .* p(2,1:p_num);
  fp(3,1:p_num) = p(1,1:p_num) .* p(3,1:p_num);
  fp(4,1:p_num) = p(2,1:p_num) .* p(2,1:p_num);
  fp(5,1:p_num) = p(2,1:p_num) .* p(3,1:p_num);
  fp(6,1:p_num) = p(3,1:p_num) .* p(3,1:p_num);

  return
end
