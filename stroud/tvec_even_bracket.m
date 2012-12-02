function t = tvec_even_bracket ( nt, theta1, theta2 )

%*****************************************************************************80
%
%% TVEC_EVEN_BRACKET computes an evenly spaced set of angles between THETA1 and THETA2.
%
%  Example:
%
%    NT = 4
%    THETA1 = 30
%    THETA2 = 90
%
%    T = ( 30, 50, 70, 90 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NT, the number of values to compute.
%
%    Input, real THETA1, THETA2, the limiting angles.
%
%    Output, real TVEC(NT), the evenly spaced angles.
%
  if ( nt == 1 )
    t(1) = ( theta1 + theta2 ) / 2.0;
  else
    for i = 1 : nt
      t(i) = ( ( nt - i     ) * theta1   ...
             + (      i - 1 ) * theta2 ) ...
             / ( nt     - 1 );
    end
  end

  return
end
