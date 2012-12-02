function c = correlation_white_noise ( n, rho, rho0 )

%*****************************************************************************80
%
%% CORRELATION_WHITE_NOISE evaluates the white noise correlation function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Petter Abrahamsen,
%    A Review of Gaussian Random Fields and Correlation Functions,
%    Norwegian Computing Center, 1997.
%
%  Parameters:
%
%    Input, integer N, the number of arguments.
%
%    Input, real RHO(N,1), the arguments.
%
%    Input, real RHO0, the correlation length.
%
%    Output, real C(N,1), the correlations.
%
  rho = rho ( : );
%
%  We need to insist that C is a real quantity, not a logical,
%  otherwise we can't call the toeplitz function later on!
%
  c = real ( rho == 0.0 );

  return
end


  
