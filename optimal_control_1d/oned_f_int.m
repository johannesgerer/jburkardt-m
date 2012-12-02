function F = oned_f_int ( Ff, test, w_g )

%*****************************************************************************80
%
%% ONED_F_INT integrates a function times a test function.
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
%    Input, Ff, Function values at the Gauss points
%
%    Input, test, matrix of test functions evaluated at the
%    Gauss points (dim: n_gauss, n_dof)
%
%    Input, w_g, Column vector of Gauss weights
%
%    Output, F, the integral.
%
  F = test' * ( w_g .* Ff );

  return
end

