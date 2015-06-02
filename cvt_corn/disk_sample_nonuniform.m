function xy = disk_sample_nonuniform ( n, r )

%*****************************************************************************80
%
%% DISK_SAMPLE_NONUNIFORM nonuniformly samples the disk of radius R.
%
%  Discussion:
%
%    This routine returns N points sampled nonuniformly at random
%    from within the unit circle.
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
%    Input, integer N, the number of points desired.
%
%    Input, real R, the radius of the disk.
%
%    Output, real XY(2,N), sample points in the disk.
%
  xy(1:2,1:n) = randn(2,n);

  xy_norm(1:n) = sqrt ( dot ( xy, xy, 1 ) );

  w(1:n) = rand(1,n);

  for i = 1 : 2
    xy(i,1:n) = r * sqrt ( sqrt ( w(1:n) ) ) .* xy(i,1:n) ./ xy_norm(1:n);
  end

  return
end

