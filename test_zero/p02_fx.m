function fx = p02_fx ( x )

%*****************************************************************************80
%
%% P02_FX evaluates 2 * x - exp ( - x ).
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
  fx = 2.0 * x - exp ( - x );

  return
end
