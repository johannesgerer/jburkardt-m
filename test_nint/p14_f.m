function value = p14_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P14_F evaluates the integrand for problem 14.
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
%    sum ( 1 <= i <= dim_num ) (-1)**i * product ( 1 <= j <= i ) x(j)
%
%  Exact Integral:
%
%    -1/3 ( 1 - (-1/2)**DIM_NUM )
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
  value(1:point_num) = 0.0;

  for point = 1 : point_num

    factor = 1.0;

    for dim = 1 : dim_num

      factor = - factor * x(dim,point);

      value(point) = value(point) + factor;

    end

  end

  p14_i4 ( 'I', '#', point_num );

  return
end
