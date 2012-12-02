function x = stretch_rs ( r, s, i )

%*****************************************************************************80
%
%% STRETCH_RS returns a data component given (R,S).
%
%  Discussion:
%
%    This routine shifts by (1,2) and stretches by (3,4).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, S, the coordinates of a point that lies on the
%    boundary of the square.
%
%    Input, integer I, the component of the data which is to be returned.
%
%    Output, real X, the I-th component of the data vector X, evaluated
%    at the point (R,S), which is on a corner, or edge, of the unit square.
%
  if ( i == 1 )
    x = 3.0 * r + 1.0;
  elseif ( i == 2 )
    x = 4.0 * s + 2.0;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'STRETCH_RS - Fatal error!\n' );
    fprintf ( 1, '  Illegal component index I = %d\n', i );
    error ( 'STRETCH_RS - Fatal error!' );
  end

  return
end
