function value = p12_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P12_F evaluates the integrand for problem 12.
%
%  Discussion:
%
%    The highly oscillatory nature of the integrand makes this
%    a difficult and perhaps even dubious test.
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
%    product ( 1 <= i <= dim_num ) ( i * cos ( i * x(i) ) )
%
%  Exact Integral:
%
%    product ( 1 <= I <= DIM_NUM ) sin ( i )
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
%    Paul Bratley, Bennett Fox, Harald Niederreiter,
%    Implementation and Tests of Low-Discrepancy Sequences,
%    ACM Transactions on Modeling and Computer Simulation,
%    Volume 2, Number 3, July 1992, pages 195-213.
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
  value(1:point_num) = 1.0;

  for point = 1 : point_num
    for dim = 1 : dim_num
      value(point) = value(point) * dim * cos ( dim * x(dim,point) );
    end
  end

  p12_i4 ( 'I', '#', point_num );

  return
end
