function value = p18_f ( dim_num, point_num, x )

%*****************************************************************************80
%
%% P18_F evaluates the integrand for problem 18.
%
%  Discussion:
%
%    This is the characteristic function of the interior of the 
%    N sphere of radius R and center Z, to be integrated within the
%    unit hypercube [0,1]^N.  If the user picks a combination of R
%    and Z that causes the volume of the sphere to lie at least
%    partially outside the unit hypercube, the formula for the
%    exact integral will no longer be correct.
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
%    R defaults to 0.50.  
%    You can change R by calling P18_R8.
%
%    Z(1:DIM_NUM) defaults to (0.5,0.5,...0.5).  
%    You can change Z by calling P18_R8VEC.
%
%  Integrand:
%
%    f(x) = 1 if X(1:DIM_NUM) is less than R from Z(1:DIM_NUM),
%           0 otherwise.
%
%  Exact Integral:
%
%    The volume of the DIM_NUM sphere of radius R.
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
  z = p18_r8vec ( 'G', 'Z', dim_num, z );

  r = 0.0;
  r = p18_r8 ( 'G', 'R', r );

  value(1:point_num) = 0.0;

  for point = 1 : point_num

    d = sqrt ( sum ( ( x(1:dim_num,point) - z(1:dim_num)' ).^2 ) );

    if ( d <= r )
      value(point) = 1.0;
    else
      value(point) = 0.0;
    end

  end

  p18_i4 ( 'I', '#', point_num );

  return
end
