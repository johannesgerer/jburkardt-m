function f = basic_hat ( x )

%*****************************************************************************80
%
%% BASIC_HAT evaluates the basic hat function on [-1, 1].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 April 2011
%
%  Author:
%
%   Eugene Cliff
%
%  Reference:
%
%    Jeffrey Borggaard, John Burkardt, John Burns, Eugene Cliff,
%    Working Notes on a Reaction Diffusion Model: a Finite Element Formulation.
%
%  Parameters:
%
%    Input, real X(*), the points at which the function is to be evaluated.
%
%    Output. real F(*), the function values.
%
  f = ( x + 1 ) .* ( -1 <= x ) .* ( x <  0 ) ... 
    + ( 1 - x ) .* (  0 <= x ) .* ( x <= 1 );

  return
end
