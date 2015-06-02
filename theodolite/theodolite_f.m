function f = theodolite_f ( xyz_star )

%*****************************************************************************80
%
%% THEODOLITE_F evaluates the residual for a theodolite solution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Charles Hall,
%    Industrial Mathematics: A Course in Realism,
%    American Mathematical Monthly,
%    Volume 82, Number 6, June-July 1975, pages 651-659.
%
%  Parameters:
%
%    Input, integer N, the number of locations.
%
%    Input, real XYZ(3,N), the locations of the cameras.
%
%    Input, real AE(2,N), the azimuth and elevations of the event
%    at each camera, measured in degrees.
%
%    Input, real XYZ_STAR(3), a possible location for the event.
%
%    Output, real V, the sum of the squares of the minimum distance
%    of the event from each of the lines through a given camera,
%    at the given angles.
%
  n = 10;

  xyz = [ ...
    4000.0,  5000.0, 1000.0; ...
    1300.0,  1200.0,    0.0; ...
    1300.0, -1200.0,    0.0; ...
    2800.0,  1700.0,    5.0; ...
    2800.0, -1700.0,    5.0; ...
     200.0,  2500.0,    0.0; ...
    1600.0,   100.0,   10.0; ...
   -2000.0,  -800.0,   15.0; ...
    -600.0,   700.0,    0.0; ...
    1050.0,    90.0,    0.0 ]';

  ae = [ ...
    237.0364,   0.0; ...
    255.9639,  38.9539; ...
    107.0361,  38.9538; ...
    219.3633,  21.8942; ...
    136.6367,  21.8942; ...
    287.7447,  20.8553; ...
    190.4622,  58.4325; ...
     15.9314,  17.6014; ...
    336.3706,  29.7953; ...
    245.9453,  84.1217 ]';

  f = zeros ( n, 1 );

  for j = 1 : n

    x0 = xyz(1,j);
    y0 = xyz(2,j);
    z0 = xyz(3,j);

    a = ae(1,j) * pi / 180.0;
    e = ae(2,j) * pi / 180.0;

    ff = cos ( e ) * cos ( a );
    gg = cos ( e ) * sin ( a );
    hh = sin ( e );

    dist = line_par_point_dist_3d ( ff, gg, hh, x0, y0, z0, xyz_star );

    f(j,1) = dist;

  end

  return
end

