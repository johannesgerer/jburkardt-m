function u = u_hat ( x )

%*****************************************************************************80
%
%% U_HAT evaluates the target function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 March 2011
%
%  Author:
%
%    Jeff Borggaard, John Burkardt, Catalin Trenchea, Clayton Webster
%
%  Parameters:
%
%    Input, real X(*), the evaluation points.
%
%    Output, real U(*), the function values.
%
  u = x .* ( 1 - x.^2 );

  return
end
