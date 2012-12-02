function [ aval, cval ] = p08_gx ( )

%*****************************************************************************80
%
%% P08_GX sets data used for Rik's mechanical problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real AVAL(3,3); for each I, the values of AVAL(I,*) record
%    the (X,Y,Z) coordinates of the I-th support point.
%
%    Output, real CVAL(3), the values of the normalized spring constants.
%
  aval(1,1) = 2.0;
  aval(1,2) = 0.0;
  aval(1,3) = 0.0;

  aval(2,1) = - 1.0;
  aval(2,2) =   1.0;
  aval(2,3) =   0.0;

  aval(3,1) = - 1.0;
  aval(3,2) = - 2.0;
  aval(3,3) =   1.0;

  cval(1) = 10.0 / 21.0;
  cval(2) =  6.0 / 21.0;
  cval(3) =  5.0 / 21.0;

  return
end
