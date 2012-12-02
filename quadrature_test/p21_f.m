function value = p21_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P21_F evaluates the integrand for problem 21.
%
%  Dimension:
%
%    DIM_NUM is arbitrary.
%
%  Region:
%
%    The (surface of the) unit sphere
%
%  Integral Parameters:
%
%    C defaults to 1.  
%    Call P21_R8 to get or set this value.
%
%    E(1:DIM_NUM) defaults to (/ 2, 2, ..., 2 /).  
%    Call P21_I4VEC to get or set this value.
%
%  Integrand:
%
%    F(X) = C * X1^E1 * X2^E2 * ... * Xn^En
%
%    C is real, all exponents E are nonnegative integers.
%
%  Exact Integral:
%
%    0, if any exponent is odd.
%    2 * C * Gamma((E1+1)/2) * Gamma((E2+1)/2) * ... * Gamma((En+1)/2) 
%      / Gamma( (E1+E2+...+En+N)/2 ), otherwise.
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
%    Gerald Folland,
%    How to Integrate a Polynomial Over a Sphere,
%    American Mathematical Monthly, 
%    May 2001, pages 446-448.
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
  c = p21_r8 ( 'G', 'C', c );

  e = [];
  e = p21_i4vec ( 'G', 'E', dim_num, e );

  value(1:point_num) = c;

  for point = 1 : point_num

    for dim = 1 : dim_num
      value(point) = value(point) * x(dim,point)^e(dim);
    end

  end

  p21_i4 ( 'I', '#', point_num );

  return
end
