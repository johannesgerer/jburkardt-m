function yc = pwl_approx_1d ( nd, xd, yd, nc, xc )

%*****************************************************************************80
%
%% PWL_APPROX_1D determines the control values for a PWL approximant.
%
%  Discussion:
%
%    The piecewise linear approximant is defined by NC control pairs 
%    (XC(I),YC(I)) and approximates ND data pairs (XD(I),YD(I)).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ND, the number of data points.
%    ND must be at least 1.
%
%    Input, real XD(ND,1), the data points.
%
%    Input, real YD(ND,1), the data values.
%
%    Input, integer NC, the number of control points.
%    NC must be at least 1.
%
%    Input, real XC(NC,1), the control points.
%
%    Output, real YC(NC,1), the control values.
%

%
%  Define the NDxNC linear system that determines the control values.
%
  a = pwl_approx_1d_matrix ( nd, xd, yd, nc, xc );
%
%  Solve the system.
%
  yc = a \ yd;

  return
end
