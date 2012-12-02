function value = p31_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P31_F evaluates the integrand for problem 31.
%
%  Dimension:
%
%    DIM_NUM arbitrary.
%
%  Region:
%
%    0 <= X(1:DIM_NUM) <= 1
%
%  Integral Parameters:
%
%    There is a basis point Z associated with the integrand.
%    Z(1:DIM_NUM) defaults to ( 0.5, 0.5, ..., 0.5 ).
%    The user can set, get, or randomize this value by calling
%    P31_R8VEC.
%
%    The coefficient vector C (whose entries are usually positive)
%    controls the steepness and circularity of the pseudo-Gaussian.
%    C(1:DIM_NUM) defaults to 2.0.
%    The user can set, get, or randomize this value by calling
%    P31_R8VEC.
%
%  Integrand:
%
%    exp ( - sum ( c(1:dim_num) * abs ( x(1:dim_num) - z(1:dim_num) ) ) )
%
%  Exact Integral:
%
%    The integral is separable into
%
%      Int ( A(1) <= X(1) <= B(1) ) exp ( - C(1) * abs ( X(1) - Z(1) ) ) 
%        * Int ( A(2) <= X(2) <= B(2) ) exp ( - C(2) * abs ( X(2) - Z(2) ) )
%          * ...
%
%    Hence, the exact integral is computed as the product of
%    one dimensional integrals.  Each of these is easily computed
%    once the location of Z(I) with respect to A(I) and B(I) is
%    determined.
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
%    [Integral #5]
%    A Package for Testing Multiple Integration Subroutines,
%    in Numerical Integration: Recent Developments, Software
%    and Applications,
%    edited by Patrick Keast and Graeme Fairweather,
%    D. Reidel, 1987, pages 337-340,
%    LC: QA299.3.N38.
%
%    Kenneth Hanson,
%    Quasi-Monte Carlo: halftoning in high dimensions?
%    in Computatinal Imaging,
%    Edited by CA Bouman and RL Stevenson,
%    Proceedings SPIE,
%    Volume 5016, 2003, pages 161-172.
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
  c = p31_r8vec ( 'G', 'C', dim_num, c );

  z = [];
  z = p31_r8vec ( 'G', 'Z', dim_num, z );

  value(1:point_num) = 0.0;

  for point = 1 : point_num

    value(point) = exp ( - sum ( c(1:dim_num)' .* ...
      abs ( x(1:dim_num,point) - z(1:dim_num)' ) ) );

  end

  p31_i4 ( 'I', '#', point_num );

  return
end
