function value = p16_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P16_F evaluates the integrand for problem 16.
%
%  Discussion:
%
%    The integrand can be regarded as the L1 norm of X - Z.
%
%    It would be nice to allow the use to specify several
%    base points Z, to make the function more jagged more places%
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
%    The integrand can be regarded as the L1 norm of X - Z.
%
%    There is a basis point Z associated with the integrand.
%    Z(1:DIM_NUM) defaults to ( 0.5, 0.5, ..., 0.5 ).
%    The user can set, get, or randomize this value by calling
%    P16_R8VEC.
%
%  Integrand:
%
%    sum ( abs ( x(1:dim_num) - z(1:dim_num) ) )
%
%  Exact Integral:
%
%    The integral is separable into
%
%       Int ( A(1) <= X(1) <= B(1) ) abs ( X(1) - Z(1) ) 
%     * Product ( B(1:N)-A(1:N), skip index 1 )
%     + Int ( A(2) <= X(2) <= B(2) ) abs ( X(2) - Z(2) )
%     * Product ( B(1:N)-A(1:N), skip index 2 )
%     ...
%     + Int ( A(N) <= X(N) <= B(N) ) abs ( X(N) - Z(N) )
%     * Product ( B(1:N)-A(1:N), skip index N )
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
  z = [];
  z = p16_r8vec ( 'G', 'Z', dim_num, z );

  value(1:point_num) = 0.0;

  for point = 1 : point_num

    value(point) = sum ( abs ( x(1:dim_num,point) - z(1:dim_num)' ) );

  end

  p16_i4 ( 'I', '#', point_num );

  return
end
