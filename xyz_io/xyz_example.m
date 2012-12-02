function xyz = xyz_example ( point_num )

%*****************************************************************************80
%
%% XYZ_EXAMPLE computes points for an example XYZ dataset.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer POINT_NUM, the number of points.
%
%    Output, real XYZ(3,POINT_NUM), the point coordinates.
%
  r = 1.0;
  theta1 = 0.0;
  theta2 = 3.0 * 2.0 * pi;
  a = 2.0 / ( theta2 - theta1 );

  for i = 1 : point_num

    if ( point_num == 1 )
      theta = 0.5 * ( theta1 + theta2 );
    else
      theta = ( ( point_num - i     ) * theta1 ...
              + (             i - 1 ) * theta2 ) ...
              / ( point_num     - 1 );
    end

    xyz(1,i) = r * cos ( theta );
    xyz(2,i) = r * sin ( theta );
    xyz(3,i) = a * theta;

  end

  return
end
