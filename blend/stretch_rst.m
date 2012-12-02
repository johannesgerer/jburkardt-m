function x = stretch_rst ( r, s, t, i )

%*****************************************************************************80
%
%% STRETCH_RST returns a data component given (R,S,T).
%
%  Discussion:
%
%    This routine shifts by (1,2,3) and stretches by (4,5,6)
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
%    Input, real R, S, T, the coordinates of a point that lies on the
%    boundary of the cube.
%
%    Input, integer I, the component of the data which is to be returned.
%
%    Output, real X, the I-th component of the data vector X, evaluated
%    at the point (R,S), which is on a corner, edge or face of the unit cube.
%
  if ( i == 1 )
    x = 4.0 * r + 1.0;
  elseif ( i == 2 )
    x = 5.0 * s + 2.0;
  elseif ( i == 3 )
    x = 6.0 * t + 3.0;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'STRETCH_RST - Fatal error!\n' );
    fprintf ( 1, '  Illegal component index I = %d\n', i );
    error ( 'STRETCH_RST - Fatal error!' );
  end

  return
end
