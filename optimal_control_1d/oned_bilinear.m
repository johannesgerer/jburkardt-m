function M = oned_bilinear ( kernel, phi, test, w_g )

%*****************************************************************************80
%
%% ONED_BILINEAR integrates kernel * phi * test.
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
%    Jeff Borggaard
%
%  Parameters:
%
%    Input, kernel(n_gauss), the kernel function in the integral evaluated
%    at the Gauss points
%
%    Input, phi(n_gauss,n_dof), the matrix of element test functions evaluated
%    at the Gauss points.
%
%    Input, test(n_gauss,n_test), the matrix of test functions evaluated at the
%    Gauss points.       
%
%    Input, w_g(n_gauss), the column vector of Gauss weights
%
%    Output, real M(n_test,n_dof), the integral of kernel * phi * test.
%
  M = test' * diag ( kernel .* w_g ) * phi;

  return
end
