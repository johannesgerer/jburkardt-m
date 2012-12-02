function value = p06_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P06_F evaluates the integrand for problem 06.
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
%    product ( 2 * abs ( 2 * x(1:dim_num) - 1 ) )
%
%  Exact Integral:
%
%    1
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
%    Volume 2, Number 3, pages 195-213, 1992.
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
    value(point) = prod ( 2.0 * abs ( 2.0 * x(1:dim_num,point) - 1.0 ) );
  end

  p06_i4 ( 'I', '#', point_num );

  return
end
