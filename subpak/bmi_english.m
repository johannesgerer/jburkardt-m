function value = bmi_english ( w_lb, h_ft, h_in )

%*****************************************************************************80
%
%% BMI_ENGLISH computes the body mass index given English measurements.
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
%    Input, real W_LB, the body weight in pounds.
%
%    Input, real H_FT, H_IN, the body height in feet and inches
%
%    Output, real VALUE, the body mass index.
%
  w_kg = pounds_to_kilograms ( w_lb );

  h_m = feet_to_meters ( h_ft + ( h_in / 12.0 ) );

  value = bmi_metric ( w_kg, h_m );

  return
end
