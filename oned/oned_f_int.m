function F = oned_f_int ( Ff, test, w_g )

%*****************************************************************************80
%
%% ONE_F_INT integrates a function against the finite element test functions.
%
%  Parameters:
%
%    Input, real Ff(N_GAUSS), the function values at the Gauss points.
%
%    Input, real TEST(N_GAUSS,N_DOF), the matrix of test functions evaluated 
%    at the Gauss points.
%
%    Input, real W_G(N_GAUSS), the Gauss weights.
%
%    Output, real F(N_DOF), the integral of the function against each of the
%    test functions.
%
  F = test' * ( w_g .* Ff );

  return
end

