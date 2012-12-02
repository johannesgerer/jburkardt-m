function t = tvec_even_bracket3 ( nt, theta1, theta2 )

%*****************************************************************************80
%
%% TVEC_EVEN_BRACKET3 computes an evenly spaced set of angles between THETA1 and THETA2.
%
%  Example:
%
%    NT = 3
%    THETA1 = 30
%    THETA2 = 90
%
%    T = ( 40, 60, 80 )
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
    t(i) = ( ( 2 * nt - 2 * i + 1 ) * theta1   ...
           + (          2 * i - 1 ) * theta2 ) ...
           / ( 2 * nt             );
  end

  return
end
