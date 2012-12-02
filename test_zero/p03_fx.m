function fx = p03_fx ( x )

%*****************************************************************************80
%
%% P03_FX evaluates x * exp ( - x ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 July 2011
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
  fx = x .* exp ( - x );

  return
end
