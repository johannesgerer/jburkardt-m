function value = p27_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P27_F evaluates the integrand for problem 27.
%
%  Dimension:
%
%    N arbitrary.
%
%  Region:
%
%    0 <= X(1:DIM_NUM) <= 1
%
%  Integral Parameters:
%
%    The integral depends on a parameter R and vector C(1:N).
%
%    R defaults to 0.3.
%
%    The reference suggests choosing C at random in [0,1]
%    and then multiplying by the normalizing factor (25/N).
%    C(1:N) defaults to 1/N.
%
%    To get or set R, call P27_R8.
%    To get or set C, call P27_R8VEC.
%
%  Integrand:
%
%    cos ( 2 * pi * R + sum ( c(1:n) * x(1:n) ) )
%
%  Exact Integral:
%
%    2^N * cos ( 2 * pi * R + 0.5 * sum ( c(1:n) ) )
%      * product ( sin ( 0.5 * c(1:n) ) / c(1:n) )
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
%    Alan Genz,
%    [Integral #1]
%    A Package for Testing Multiple Integration Subroutines,
%    in Numerical Integration: Recent Developments, Software
%    and Applications,
%    edited by Patrick Keast and Graeme Fairweather,
%    D Reidel, 1987, pages 337-340,
%    LC: QA299.3.N38.
%
%    Thomas Patterson,
%    [Integral #5],
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
%    Output, real VALUE(POINT_NUM,1), the integrand values.
%
  r = 0.0;
  r = p27_r8 ( 'G', 'R', r );

  c = [];
  c = p27_r8vec ( 'G', 'C', dim_num, c );
  value(1:point_num,1) = 0.0;

  for point = 1 : point_num

    arg = 2.0 * pi * r + c(1:dim_num,1)' * x(1:dim_num,point);
    value(point,1) = cos ( arg );

  end

  p27_i4 ( 'I', '#', point_num );

  return
end
