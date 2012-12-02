function f = f_function ( x )

%*****************************************************************************80
%
%% F_FUNCTION evaluates the right hand side of the finite element system.
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
%    Output, real F(*), the function values.
%
  f = - 15*x.^4 + 3*x.^2 - 6*x;

  return
end
