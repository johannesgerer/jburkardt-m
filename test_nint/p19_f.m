function value = p19_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P19_F evaluates the integrand for problem 19.
%
%  Dimension:
%
%    DIM_NUM is arbitrary.
%
%  Region:
%
%    0 <= X(1:DIM_NUM) <= 1
%
%  Integral Parameters:
%
%    Z defaults to (1/3,1/3,...,1/3).  
%    You can reset Z by calling P19_R8VEC.
%
%  Integrand:
%
%    f(x) = product ( sqrt ( abs ( x(1:dim_num) - z(1:dim_num) ) ) )
%
%  Exact Integral:
%
%    With Z as given, 
%
%      (2/3)**DIM_NUM * ( (2/3)**(3/2) + (1/3)**(3/2) )**DIM_NUM
%
%    or approximately 0.49**DIM_NUM.
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
%    Arnold Krommer, Christoph Ueberhuber,
%    Numerical Integration on Advanced Systems,
%    Springer, 1994,
%    ISBN: 3540584102,
%    LC: QA299.3.K76.
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
  z = [];
  z = p19_r8vec ( 'G', 'Z', dim_num, z );

  value(1:point_num) = 0.0;

  for point = 1 : point_num
    value(point) = prod ( sqrt ( abs ( x(1:dim_num,point) - z(1:dim_num)' ) ) );
  end

  p19_i4 ( 'I', '#', point_num );

  return
end
