function lambda = bodewig_eigenvalues ( )

%*****************************************************************************80
%
%% BODEWIG_EIGENVALUES returns the eigenvalues of the Bodewig matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real LAMBDA(4), the eigenvalues.
%
  lambda(1:4) = [ ...
    -8.028578352396531, ...
     7.932904717870018, ...
     5.668864372830019, ...
    -1.573190738303506 ];

  return
end
