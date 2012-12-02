function x = identity_r ( r, i )

%*****************************************************************************80
%
%% IDENTITY_R returns a data component given (R).
%
%  Discussion:
%
%    This is a dummy routine, which simply returns (R).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the coordinate of a point that lies on the
%    boundary of the cube.
%
%    Input, integer I, the component of the data which is to be returned.
%
%    Output, real X, the I-th component of the data vector X, evaluated
%    at the point (R), which is on an endpoint of the unit line segment.
%
  if ( i == 1 )
    x = r;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'IDENTITY_R - Fatal error!\n' );
    fprintf ( 1, '  Illegal component index I = %d\n', i );
    error ( 'IDENTITY_R - Fatal error!' );
  end

  return
end
