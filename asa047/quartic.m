function fx = quartic ( x )

%*****************************************************************************80
%
%% QUARTIC evaluates a function defined by a sum of fourth powers.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    R ONeill,
%    Algorithm AS 47:
%    Function Minimization Using a Simplex Procedure,
%    Applied Statistics,
%    Volume 20, Number 3, 1971, pages 338-345.
%
%  Parameters:
%
%    Input, real X(10), the argument.
%
%    Output, real FX, the value of the function.
%
  fx = sum ( x(1:10).^4 );

  return
end
