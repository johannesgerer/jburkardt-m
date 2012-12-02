function value = p20_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P20_F evaluates the integrand for problem 20.
%
%  Dimension:
%
%    DIM_NUM is arbitrary.
%
%  Region:
%
%    A <= X(1:DIM_NUM) <= B
%
%  Integrand:
%
%    f(x) = ( sum ( x(1:dim_num) ) )**p
%
%    P is greater than -dim_num, and is not a negative integer.
%
%  Exact Integral:
%
%    sum ( 0 <= i <= dim_num ) (-1)**i * choose(dim_num,i) 
%      * ((dim_num-i)*b+i*a)**(dim_num+p)
%      / ( (t+1) * (t+2) * ... * (t+dim_num) )
%
%  Parameters:
%
%    A defaults to 0.0.  You can change A by calling P20_R8.
%
%    B defaults to 1.0.  You can change B by calling P20_R8.
%
%    P defaults to 2.0.  You can change P by calling P20_R8.
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
  p = 0.0;
  p = p20_r8 ( 'G', 'P', p );

  value(1:point_num) = 0.0;

  for point = 1 : point_num
    value(point) = ( sum ( x(1:dim_num,point) ) )^p;
  end

  p20_i4 ( 'I', '#', point_num );

  return
end
