function xy = disk_sample_uniform ( n, r )

%*****************************************************************************80
%
%% DISK_SAMPLE_UNIFORM uniformly samples the disk of radius R.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 December 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of values.
%
%    Input, real R, the radius of the disk.
%
%    Output, real XY(2,N), sample points in the disk.
%
  w = sqrt ( rand ( 1, n ) );
  t = 2.0 * pi * rand ( 1, n );

  xy(1,1:n) = r * w(1:n) .* cos ( t(1:n) );
  xy(2,1:n) = r * w(1:n) .* sin ( t(1:n) );

  return
end

