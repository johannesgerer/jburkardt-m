function yi = nearest_interp_1d ( nd, xd, yd, ni, xi )

%*****************************************************************************80
%
%% NEAREST_INTERP_1D evaluates the nearest neighbor interpolant.
%
%  Discussion:
%
%    The nearest neighbor interpolant L(ND,XD,YD)(X) is the piecewise
%    constant function which interpolates the data (XD(I),YD(I)) for I = 1
%    to ND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 August 2012
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
%    Input, integer NI, the number of interpolation points.
%
%    Input, real XI(NI,1), the interpolation points.
%
%    Output, real YI(NI,1), the interpolated values.
%

%
%  KNNSEARCH is a built-in Matlab function which, with this call, returns
%  the indices in XD of the nearest elements to the elements in XI.
%
  idx = knnsearch ( xd, xi );

  yi = yd(idx);

  return
end
