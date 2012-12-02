function value = p28_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P28_F evaluates the integrand for problem 28.
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
%    To get or set C or Z, call P28_R8VEC.
%
%    The reference suggests choosing C by initializing
%    it to random values in [0,1], and then normalizing so that
%
%      sum ( 1/C(1:N)**2 ) = 170 / N**(7/2)
%
%    C(1:N) used to default to N**(9/4) / sqrt(170)
%    but this is INSUPPORTABLE for large dimension N.
%
%    So now we're setting C(1:N) to default to 1.0
%
%    The reference suggests choosing Z at random in [0,1].
%
%    Z(1:N) defaults to 0.5.
%
%  Integrand:
%
%    1 / product ( C(1:DIM_NUM)**2 + ( X(1:DIM_NUM) - Z(1:DIM_NUM) )**2 )
%
%  Exact Integral:
%
%    product ( (   arctan ( ( 1 - Z(1:DIM_NUM) ) / C(1:DIM_NUM) )
%                + arctan (       Z(1:DIM_NUM)   / C(1:DIM_NUM) ) 
%              ) / C(1:DIM_NUM)
%            )
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
%    [Integral #2]
%    A Package for Testing Multiple Integration Subroutines,
%    in Numerical Integration: Recent Developments, Software
%    and Applications,
%    edited by Patrick Keast and Graeme Fairweather,
%    D Reidel, 1987, pages 337-340,
%    LC: QA299.3.N38.
%
%    Thomas Patterson,
%    [Integral #6],
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
  c = p28_r8vec ( 'G', 'C', dim_num, c );

  z = [];
  z = p28_r8vec ( 'G', 'Z', dim_num, z );

  value(1:point_num) = 0.0;

  for point = 1 : point_num

    value(point) = 1.0 / prod ( c(1:dim_num)'.^2 ...
      + ( x(1:dim_num,point) - z(1:dim_num)' ).^2 );

  end

  p28_i4 ( 'I', '#', point_num );

  return
end
