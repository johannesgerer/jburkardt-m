function value = poly1 ( n, x )

%*****************************************************************************80
%
%% POLY1 evaluates a sample polynomial function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
  value = 1.0 + 2.0 * x + 3.0 * x.^2 + 4.0 * x.^3 + 5.0 * x.^5;

  return
end
