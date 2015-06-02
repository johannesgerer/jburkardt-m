function value = r8_invchi_sample ( df )

%*****************************************************************************80
%
%% R8_INVCHI_SAMPLE samples an inverse chi-squared distribution.
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
%    John Burkardt.
%
%  Parameters:
%
%    Input, real DF, the degrees of freedom.
%    0.0 < DF.
%
%    Output, real VALUE, a sample value.
%
  a = 0.5;
  b = 0.5 * df;

  value = r8_gamma_sample ( a, b );

  if ( value ~= 0.0 )
    value = 1.0 / value;
  end

  return
end