function value = p24_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P24_F evaluates the integrand for problem 24.
%
%  Dimension:
%
%    DIM_NUM is arbitrary.
%
%  Region:
%
%    0 <= X(1:DIM_NUM) <= 1
%
%  Integral Parameters:
%
%    C(1:DIM_NUM) defaults to 0.0.
%
%    A typical, more difficult problem, has
%      C(I) = I**(1/3)
% 
%    Call P24_R8VEC to get or set C.
%
%  Integrand:
%
%    F(X) = product (   ( abs ( 4 * X(1:DIM_NUM) - 2 ) + C(1:DIM_NUM) ) 
%                     / ( 1 + C(1:DIM_NUM) ) 
%                   )
%
%  Exact Integral:
%
%    1
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
%    Stephen Joe, Frances Kuo,
%    Remark on Algorithm 659:
%    Implementing Sobol's Quasirandom Seqence Generator,
%    ACM Transactions on Mathematical Software,
%    Volume 29, Number 1, March 2003, pages 49-57.
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
  c = p24_r8vec ( 'G', 'C', dim_num, c );

  value(1:point_num) = 0.0;

  for point = 1 : point_num

    value(point) = prod ...
    ( ...
        ( abs ( 4.0 * x(1:dim_num,point) - 2.0 ) + c(1:dim_num)' ) ...
      ./ ( 1.0 + c(1:dim_num)' ) ...
    );
  end

  p24_i4 ( 'I', '#', point_num );

  return
end
