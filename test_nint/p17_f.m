function value = p17_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P17_F evaluates the integrand for problem 17.
%
%  Discussion:
%
%    This integrand can be regarded as the square of the L2
%    norm of X - Z.
%
%    This integrand has the advantage of symmetry under rotation
%    about Z.  Thus, it is possible to test whether a particular
%    quadrature rule has an occasional advantage because it
%    "lines up" with the X and Y coordinate axes and hence can
%    integrate some separable integrals very well.
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
%    P17_R8VEC.
%
%  Integrand:
%
%    sum ( ( x(1:dim_num) - z(1:dim_num) )**2 )
%
%  Exact Integral:
%
%    The integral may be broken into the sum of weighted 
%    one dimensional integrals.
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
  z = p17_r8vec ( 'G', 'Z', dim_num, z );

  value(1:point_num) = 0.0;

  for point = 1 : point_num
    value(point) = sum ( ( x(1:dim_num,point) - z(1:dim_num)' ).^2 );
  end

  p17_i4 ( 'I', '#', point_num );

  return
end
