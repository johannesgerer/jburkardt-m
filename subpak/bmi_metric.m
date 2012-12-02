function value = bmi_metric ( w_kg, h_m )

%*****************************************************************************80
%
%% BMI_METRIC computes the body mass index given metric measurements.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real W_KG, the body weight in kilograms.
%
%    Input, real H_M, the body height in meters.
%
%    Output, real VALUE, the body mass index.
%
  value = w_kg / ( h_m * h_m );

  return
end
