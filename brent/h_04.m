function value = h_04 ( x )

%*****************************************************************************80
%
%% H_04 evaluates ( x + sin ( x ) ) * exp ( - x * x ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the point at which F is to be evaluated.
%
%    Output, real VALUE, the value of the function at X.
%
  value = ( x + sin ( x ) ) * exp ( - x * x );

  return
end
