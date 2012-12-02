function x = identity_rst ( r, s, t, i )

%*****************************************************************************80
%
%% IDENTITY_RST returns a data component given (R,S,T).
%
%  Discussion:
%
%    This is a dummy routine, which simply returns (R,S,T).
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
%    Input, real R, S, T, the coordinates of a point that lies on the
%    boundary of the cube.
%
%    Input, integer I, the component of the data which is to be returned.
%
%    Output, real X, the I-th component of the data vector X, evaluated
%    at the point (R,S), which is on a corner, edge or face of the unit cube.
%
  if ( i == 1 )
    x = r;
  elseif ( i == 2 )
    x = s;
  elseif ( i == 3 )
    x = t;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'IDENTITY_RST - Fatal error!\n' );
    fprintf ( 1, '  Illegal component index I = %d\', i );
    error ( 'IDENTITY_RST - Fatal error!'\n' );
  end

  return
end
