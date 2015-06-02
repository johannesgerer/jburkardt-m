function value = r8_invgam_sample ( beta, alpha )

%*****************************************************************************80
%
%% R8_INVGAM_SAMPLE samples an inverse gamma distribution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2013
%
%  Author:
%
%    Original FORTRAN90 version by Guannan Zhang.
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, real BETA, the rate parameter.
%    0.0 < BETA.
%
%    Input, real ALPHA, the shape parameter.
%    0.0 < ALPHA.
%
%    Output, real VALUE, a sample value.
%
  value = r8_gamma_sample ( beta, alpha );

  if ( value ~= 0.0 )
    value = 1.0 / value;
  end

  return
end