function M = oned_bilinear ( kernel, phi, test, w_g )

%*****************************************************************************80
%
%% ONE_BILINEAR evaluates a bilinear form.
%
%  Discussion:
%
%    This function computes integral ( kernel * phi * test }
%
%    The calculation that is carried out is equivalent to:
%
%      [ n_gauss, n_test ] = size ( test );
%      [ n_gauss, n_dof ] = size ( phi );
%
%      M = zeros ( n_test, n_dof );
%      for i = 1 : n_test
%        for j = 1 : n_dof
%          M(i,j) = ( kernel' .* test(:,i)' ) * ( phi(:,j) .* w_g );
%        end
%      end
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Parameters:
%
%    Input, real KERNEL(N_GAUSS), the kernel function in the integral,
%    evaluated at the Gauss points.
%
%    Input, real PHI(N_GAUSS,N_DOF), the element test functions evaluated
%    at the Gauss points.
%
%    Input, real TEST(N_GAUSS,N_TEST), the test functions evaluated at the
%    Gauss points.     
%
%    Input, real W_G(N_GAUSS,1), a column vector of Gauss weights.
%
%    Output, real M(N_TEST,N_DOF), the bilinear form.
%
  M = test' * diag ( kernel .* w_g ) * phi;

  return
end
