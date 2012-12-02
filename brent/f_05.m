function value = f_05 ( x )

%*****************************************************************************80
%
%% F_05 evaluates (x+3)*(x-1)*(x-1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2008
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
  value = ( x + 3.0 ) * ( x - 1.0 ) * ( x - 1.0 );

  return
end
