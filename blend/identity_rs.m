function x = identity_rs ( r, s, i )

%*****************************************************************************80
%
%% IDENTITY_RS returns a data component given (R,S).
%
%  Discussion:
%
%    This is a dummy routine, which simply returns (R,S).
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
%    Input, real R, S, the coordinates of a point that lies on the
%    boundary of the square.
%
%    Input, integer I, the component of the data which is to be returned.
%
%    Output, real X, the I-th component of the data vector X, evaluated
%    at the point (R,S), which is on a corner, or edge, of the unit square.
%
  if ( i == 1 )
    x = r;
  elseif ( i == 2 )
    x = s;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'IDENTITY_RS - Fatal error!\n' );
    fprintf ( 1, '  Illegal component index I = %d\n', i );
    error ( 'IDENTITY_RS - Fatal error!' );
  end

  return
end
