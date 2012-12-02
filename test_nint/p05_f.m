function value = p05_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P05_F evaluates the integrand for problem 05.
%
%  Dimension:
%
%    N arbitrary.
%
%  Region:
%
%    0 <= X(1:DIM_NUM) <= 1
%
%  Integrand:
%
%    2**DIM_NUM / ( 1 + sum ( 2 * x(1:dim_num) ) )
%
%  Exact Integral:
%
%    For DIM_NUM = 1:
%
%      ln ( 3 )
%
%    For DIM_NUM = 2:
%
%      ln ( 3125 / 729 )
%
%    For DIM_NUM = 3:
%
%      0.5 * ( 49 * ln ( 7 ) - 75 * ln ( 5 ) + 27 * ln ( 3 ) )
% 
%    For DIM_NUM = 4:
%
%      225 * ln ( 3 ) + 125 * ln ( 5 ) - 686 * ln ( 7 ) / 3
%
%    For DIM_NUM = 5:
%
%      ( -65205 * ln ( 3 ) - 6250 * ln ( 5 ) + 24010 * ln ( 7 ) 
%      + 14641 * ln ( 11 ) ) / 24
%
%  Approximate Integral:
%
%    DIM_NUM  VALUE
%
%       1  1.098612289
%       2  1.455514830
%       3  2.152142833
%       4  3.402716587
%       5  5.620255523
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971,
%    ISBN: 0130438936,
%    LC: QA311.S85.
%
%    Arthur Stroud, Don Secrest,
%    Gaussian Quadrature Formulas,
%    Prentice Hall, 1966,
%    LC: QA299.4G3S7.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the argument.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, real X(DIM_NUM,POINT_NUM), the evaluation points.
%
%    Output, real VALUE(POINT_NUM), the integrand values.
%
  value(1:point_num) = 0.0;

  for point = 1 : point_num
    value(point) = 2.0^dim_num / ( 1.0 + sum ( 2.0 * x(1:dim_num,point) ) );
  end

  p05_i4 ( 'I', '#', point_num );

  return
end
