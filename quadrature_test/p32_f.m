function value = p32_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P32_F evaluates the integrand for problem 32.
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
%    The default value of C(1:N) is (1/2)^(1/N).
%
%    The default value of Z(1:N) is (1/2)^(1/N).
%
%  Integrand:
%
%    exp ( c(1:n)*x(1:n) ) if all x(1:n) <= z(1:n)
%    0                        otherwise
%
%  Exact Integral:
%
%    product ( g(1:n)(x,z,a,b,c) )
%
%    where g(i)(x,z,a,b,c) =
%
%      0                                         if z(i) <= a(i)
%      ( e^(c(i)*z(i) ) - e^(c(i)*a(i)) ) / c(i) if a(i) <= z(i) <= b(i)
%      ( e^(c(i)*b(i) ) - e^(c(i)*a(i)) ) / c(i) if b(i) <= z(i)
%      
%    with obvious modifications when c(i) = 0.
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
%    [Integral #6]
%    A Package for Testing Multiple Integration Subroutines,
%    in Numerical Integration: Recent Developments, Software
%    and Applications,
%    edited by Patrick Keast and Graeme Fairweather,
%    D Reidel, 1987, pages 337-340,
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
  c = p32_r8vec ( 'G', 'C', dim_num, c );

  z = [];
  z = p32_r8vec ( 'G', 'Z', dim_num, z );

  value(1:point_num) = 0.0;

  for point = 1 : point_num

    if ( all ( x(1:dim_num,point) <= z(1:dim_num)' ) )
      value(point) = exp ( c(1:dim_num) * x(1:dim_num,point) );
    else
      value(point) = 0.0;
    end

  end

  p32_i4 ( 'I', '#', point_num );

  return
end
