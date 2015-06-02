function fx = p19_fx ( x )

%*****************************************************************************80
%
%% P19_FX evaluates the function for problem 19.
%
%  Discussion:
%
%    This function looks like an elevated cosine curve, connected by a 
%    sudden drop to a submerged cosine curve.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2013
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
  fx = cos ( 100.0 * x ) - 4.0 * erf ( 30.0 * x - 10.0 );

  return
end
