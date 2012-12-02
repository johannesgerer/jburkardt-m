function value = p08_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P08_F evaluates the integrand for problem 08.
%
%  Dimension:
%
%    DIM_NUM arbitrary.
%
%  Region:
%
%    0 <= X(1:DIM_NUM) <= 1
%
%  Integrand:
%
%    ( sin ( (pi/4) * sum ( x(1:dim_num) ) ) )**2
%
%  Exact Integral:
%
%    1/2 - sqrt ( 2**(3*DIM_NUM) ) * cos ( DIM_NUM * pi / 4 ) ) / ( 2 * pi**DIM_NUM )
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
%    Richard Crandall,
%    Projects in Scientific Computing,
%    Springer, 2000,
%    ISBN: 0387950095,
%    LC: Q183.9.C733.
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
    value(point) = ( sin ( pi * sum ( x(1:dim_num,point) ) / 4.0 ) )^2;
  end

  p08_i4 ( 'I', '#', point_num );

  return
end
