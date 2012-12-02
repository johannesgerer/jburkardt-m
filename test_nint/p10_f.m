function value = p10_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P10_F evaluates the integrand for problem 10.
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
%    sum ( abs ( x(1:dim_num) - 0.5 ) )
%
%  Exact Integral:
%
%    DIM_NUM / 4
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
%    Thomas Patterson,
%    [Integral #4],
%    On the Construction of a Practical Ermakov-Zolotukhin 
%    Multiple Integrator,
%    in Numerical Integration: Recent Developments, Software
%    and Applications,
%    edited by Patrick Keast, Graeme Fairweather,
%    D. Reidel, 1987, pages 269-290,
%    LC: QA299.3.N38.
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971,
%    ISBN: 0130438936,
%    LC: QA311.S85.
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
    value(point) = sum ( abs ( x(1:dim_num,point) - 0.5 ) );
  end

  p10_i4 ( 'I', '#', point_num );

  return
end
