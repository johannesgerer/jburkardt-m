function value = p29_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P29_F evaluates the integrand for problem 29.
%
%  Dimension:
%
%    N arbitrary.
%
%  Region:
%
%    0 <= X(1:DIM_NUM) <= 1
%
%  Integral parameters:
%
%    The integral depends on a parameter R,
%    and a vector C(1:N).
%
%    The Genz reference uses R = 1.  The Patterson reference
%    suggests using R = 0.3.
%
%    The Patterson reference suggests choosing C at random in [0,1]
%    and then multiplying by the normalizing factor (80/N**2).
%    This is what you will get if you "RANDOMIZE" C.
%
%    C defaults to 1/DIM_NUM.
%
%    To get or set R, call P29_R8.
%    To get or set C, call P29_R8VEC.
%
%  Integrand:
%
%    1 / ( 1 + sum ( c(1:dim_num) * x(1:dim_num) ) )**(r+dim_num)
%
%  Exact Integral:
%
%    (1/A) * ( 1 / product ( c(1:dim_num) ) ) *
%    sum(0<=I(1)<=1) sum (0<=I(2)<=1) ... sum(0<=I(dim_num)<=1)
%    (-1)**sum(I(1:dim_num)) / ( 1 + sum ( i(1:dim_num)*c(1:dim_num) ) )**r
%
%    with A = r * ( r + 1 ) * ... * ( r + dim_num - 1 )
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
%    [Integral #3]
%    A Package for Testing Multiple Integration Subroutines,
%    in Numerical Integration: Recent Developments, Software
%    and Applications,
%    edited by Patrick Keast and Graeme Fairweather,
%    D Reidel, 1987, pages 337-340,
%    LC: QA299.3.N38.
%
%    Thomas Patterson,
%    [Integral #8],
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
  r = 0.0;
  r = p29_r8 ( 'G', 'R', r );

  c = [];
  c = p29_r8vec ( 'G', 'C', dim_num, c );

  value(1:point_num) = 0.0;

  for point = 1 : point_num

    value(point) = 1.0 / ( 1.0 + c(1:dim_num) * x(1:dim_num,point) )^( r + dim_num );

  end

  p29_i4 ( 'I', '#', point_num );

  return
end
