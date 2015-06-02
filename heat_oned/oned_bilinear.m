function M = oned_bilinear ( kernel, phi, test, w_g )

%*****************************************************************************80
%
%% ONED_BILINEAR integrates a kernel times a basis times a test function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 December 2012
%
%  Author:
%
%    Jeff Borggaard
%
%  Parameters:
%
%    Input, real KERNEL(N_GAUSS), the kernel function evaluated
%    at the Gauss points.
%
%    Input, real PHI(N_GAUSS,N_DOF), the element test functions evaluated
%    at the Gauss points.
%
%    Input, real TEST(N_GAUSS,N_TEST), the test functions evaluated 
%    at the Gauss points.        
%
%    Input, real W_G(N_GAUSS), the Gauss weights.
%
%    Output, real M(N_TEST,N_DOF), the integral values.
%
  M = test' * diag ( kernel .* w_g ) * phi;

  return
end
