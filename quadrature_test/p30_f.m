function value = p30_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P30_F evaluates the integrand for problem 30.
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
%    The integral depends on vectors C(1:N) and Z(1:N).
%
%    The reference suggests choosing C at random in [0,1]
%    and then multiplying by the normalizing factor sqrt(140/N**(3/2)).
%
%    C(1:N) defaults to 1/N.
%    Z(1:N) defaults to 0.5.
%
%    To get or set C or Z, call P30_R8VEC.
%
%  Integrand:
%
%    exp ( - sum ( c(1:n)**2 * ( x(1:n) - z(1:n) )**2 )
%
%  Exact Integral:
%
%    product
%    ( sqrt ( pi )
%      * (   erf ( c(1:n) * ( 1 - z(1:n) ) ) 
%          + erf ( c(1:n) *       z(1:n)   ) ) 
%      / ( 2 * c(1:n) )
%    )
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
%    [Integral #4]
%    A Package for Testing Multiple Integration Subroutines,
%    in Numerical Integration: Recent Developments, Software
%    and Applications,
%    edited by Patrick Keast and Graeme Fairweather,
%    D Reidel, 1987, pages 337-340,
%    LC: QA299.3.N38.
%
%    Thomas Patterson,
%    [Integral #9],
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
  c = [];
  c = p30_r8vec ( 'G', 'C', dim_num, c );

  z = [];
  z = p30_r8vec ( 'G', 'Z', dim_num, z );

  value(1:point_num) = 0.0;

  for point = 1 : point_num

    value(point) = exp ( ...
      - sum ( c(1:dim_num)'.^2 .* ( x(1:dim_num,point) - z(1:dim_num)' ).^2 ) );

  end

  p30_i4 ( 'I', '#', point_num );

  return
end
