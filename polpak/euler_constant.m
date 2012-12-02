function value = euler_constant

%*****************************************************************************80
%
%% EULER_CONSTANT returns the value of the Euler-Mascheroni constant.
%
%  Discussion:
%
%    The Euler-Mascheroni constant is often denoted by a lower-case
%    Gamma.  Gamma is defined as
%
%      Gamma = limit ( M -> Infinity )
%        ( sum ( 1 <= N <= M ) 1 / N ) - log ( M )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, the value of the Euler-Mascheroni constant.
%
  value = 0.577215664901532860606512090082402431042;

  return
end
