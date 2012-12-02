function value = p25_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P25_F evaluates the integrand for problem 25.
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
%    exp ( C * product ( X(1:N) ) )
%
%  Parameters:
%
%    C defaults to 0.3, and can be changed by calling P25_R8.
%
%  Exact Integral:
%
%    sum ( 1 <= i <= Infinity ) C**i / ( ( i + 1 )**N * i% )
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
%    Thomas Patterson,
%    [Integral #3],
%    On the Construction of a Practical Ermakov-Zolotukhin 
%    Multiple Integrator,
%    in Numerical Integration: Recent Developments, Software
%    and Applications,
%    edited by Patrick Keast and Graeme Fairweather,
%    D. Reidel, 1987, pages 269-290,
%    LC: QA299.3.N38.
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
  c = 0.0;
  c = p25_r8 ( 'G', 'C', c );

  value(1:point_num) = 0.0;

  for point = 1 : point_num

    value(point) = exp ( c * prod ( x(1:dim_num,point) ) );

  end

  p25_i4 ( 'I', '#', point_num );

  return
end
