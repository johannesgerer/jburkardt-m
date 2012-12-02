function fx = p13_fx ( x )

%*****************************************************************************80
%
%% P13_FX evaluates Lazy Boy.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 May 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(*), the point at which F is to be evaluated.
%
%    Output, real FX(*), the value of the function at X.
%
  slope = 0.00000000001;
  fx = slope * ( x - 100.0 );

  return
end
