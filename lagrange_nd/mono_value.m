function v = mono_value ( d, nx, f, x )

%*****************************************************************************80
%
%% MONO_VALUE evaluates a monomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 December 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer D, the spatial dimension.
%
%    Input, integer NX, the number of evaluation points.
%
%    Input, integer F(D), the exponents of the monomial.
%
%    Input, real X(D,NX), the coordinates of the evaluation points.
%
%    Output, real V(NX), the value of the monomial at X.
%
  v = ones ( nx, 1 );

  for i = 1 : d
    v(1:nx,1) = v(1:nx,1) .* x(i,1:nx)' .^ f(i);
  end

  return
end

