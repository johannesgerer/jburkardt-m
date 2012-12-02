function value = p03_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P03_F evaluates the integrand for problem 03.
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
%    ( sum ( 2 * x(1:dim_num) - 1 ) )**5
%
%  Exact Integral:
%
%    0
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
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Dover, 2007,
%    ISBN: 0486453391,
%    LC: QA299.3.D28.
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
    value(point) = ( sum ( 2.0 * x(1:dim_num,point) - 1.0 ) )^5;
  end

  p03_i4 ( 'I', '#', point_num );

  return
end
