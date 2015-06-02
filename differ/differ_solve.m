function c = differ_solve ( n, stencil, order )

%*****************************************************************************80
%
%% DIFFER_SOLVE solves for finite difference coefficients.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of stencil points.
%
%    Input, real STENCIL(N), the stencil vector.
%    The entries in this vector must be distinct.
%    No entry of STENCIL may be 0.
%
%    Input, integer ORDER, the order of the derivative to be approximated.
%    1 <= ORDER <= N.
%
%    Output, real C(N,1), the coefficients to be used
%    to multiply U(STENCIL(I))-U(0), so that the sum forms an
%    approximation to the derivative of order ORDER, with error 
%    of order H^(N+1-ORDER).
%
  a = differ_matrix ( n, stencil );

  b = zeros ( n, 1 );
  b(order) = 1.0;

  c = a \ b;

  return
end
