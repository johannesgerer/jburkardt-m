function value = p26_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P26_F evaluates the integrand for problem 26.
%
%  Discussion:
%
%    The integrand is similar to that for the Patterson integral #7,
%    except for a normalization of the constants, and a (random) constant
%    factor in the integrand.
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
%    The integral depends on a parameter vector C(1:N).
%
%    The reference suggests choosing C at random in [0,1].
%    C(1:N) defaults to 1/N.
%
%    To get or set C, call P26_R8VEC.
%
%  Integrand:
%
%    product ( c(1:dim_num) * ( exp ( - c(1:dim_num) * x(1:dim_num) ) ) )
%    = product ( c(1:dim_num) ) * exp ( - sum ( c(1:dim_num) * x(1:dim_num) ) )
%
%  Exact Integral:
%
%    product ( 1 - exp ( c(1:n) ) )
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
%    [Integral #1],
%    On the Construction of a Practical Ermakov-Zolotukhin 
%    Multiple Integrator,
%    in Numerical Integration: Recent Developments, Software
%    and Applications,
%    edited by Patrick Keast and Graeme Fairweather,
%    D. Reidel, 1987, pages 269-290,
%    LC: QA299.3.N38
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
  c = p26_r8vec ( 'G', 'C', dim_num, c );

  value(1:point_num) = 0.0;

  for point = 1 : point_num

    value(point) = prod ( c(1:dim_num) ) ...
      * exp ( - c(1:dim_num) * x(1:dim_num,point) );
  end

  p26_i4 ( 'I', '#', point_num );

  return
end
