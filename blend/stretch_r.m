function x = stretch_r ( r, i )

%*****************************************************************************80
%
%% STRETCH_R returns a data component given (R).
%
%  Discussion:
%
%    This routine shifts by 1 and stretches by 2.
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
    x = 2.0 * r + 1.0;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'STRETCH_R - Fatal error!\n' );
    fprintf ( 1, '  Illegal component index I = %d\n', i );
    error ( 'STRETCH_R - Fatal error!' );
  end

  return
end
