function t = tvec_even_bracket2 ( nt, theta1, theta2 )

%*****************************************************************************80
%
%% TVEC_EVEN_BRACKET2 computes an evenly spaced set of angles between THETA1 and THETA2.
%
%  Example:
%
%    NT = 5
%    THETA1 = 30
%    THETA2 = 90
%
%    T = ( 40, 50, 60, 70, 80 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 May 2004
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
  for i = 1 : nt
    t(i) = ( ( nt + 1 - i ) * theta1   ...
           + (          i ) * theta2 ) ...
           / ( nt + 1     );
  end

  return
end
