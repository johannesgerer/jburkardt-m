function value = r8_scinvchi_sample ( df, s )

%*****************************************************************************80
%
%% R8_SCINVCHI_SAMPLE: sample a scaled inverse chi-squared distribution.
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
%    John Burkardt
%
%  Parameters:
%
%    Input, real DF, the degrees of freedom.
%    0.0 < DF.
%
%    Input, real S, the scale factor.
%    0.0 < S.
%
%    Input, real VALUE, a sample value.
%
  a = 0.5 * df * s;
  b = 0.5 * df;

  value = r8_gamma_sample ( a, b );

  if ( value ~= 0.0 )
    value = 1.0 / value;
  end

  return
end