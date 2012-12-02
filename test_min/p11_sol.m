function [ know, x ] = p11_sol ( )

%*****************************************************************************80
%
%% P11_SOL returns the solution for problem 11.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, integer KNOW.
%    If KNOW is 0, then the solution is not known.
%    If KNOW is positive, then the solution is known, and is returned in X.
%
%    Output, real X, the solution, if known.
%
  know = 1;

  x = 1.0 / 3.0;

  return
end
