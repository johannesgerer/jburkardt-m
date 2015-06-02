function F = oned_f_int ( Ff, test, w_g )

%*****************************************************************************80
%
%% ONED_F_INT computes the integral of a function times a test function.
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
%    Input, real Ff(N_GAUSS), the function values at the Gauss points.
%
%    Input, real TEST(N_GAUSS,N_DOF), the test functions evaluated at the
%    Gauss points.
%
%    Input, real W_G(N_GAUSS), the Gauss weights.
%
  F = test' * ( w_g .* Ff );

  return
end

