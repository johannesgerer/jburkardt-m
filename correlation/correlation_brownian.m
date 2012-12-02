function c = correlation_brownian ( m, n, s, t, rho0 )

%*****************************************************************************80
%
%% CORRELATION_BROWNIAN computes the Brownian correlation function.
%
%  Discussion:
%
%    C(I,J) is the correlation Cor ( S(I), T(J) ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of arguments.
%
%    Input, real S(M), T(N), two sets of arguments.
%
%    Input, real RHO0, the correlation length.
%
%    Output, real C(M,N), the correlations.
%
  c = ones ( m, n );

  [ S, T ] = meshgrid ( s, t );
%
%  The wretched MESHGRID function produces the transpose of what I would
%  have expected, which causes problems when M is not equal to N!
%
  T = T';
  S = S';

  i = find ( max ( S, T ) ~= 0.0 );

  c(i) = sqrt ( min ( S(i), T(i) ) ./ max ( S(i), T(i) ) );
  
  return
end
