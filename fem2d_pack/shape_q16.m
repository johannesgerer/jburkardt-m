function [ t, dtdr, dtds ] = shape_q16 ( r, s )

%*****************************************************************************80
%
%% SHAPE_Q16 evaluates shape functions for a 16 node reference quadrilateral.
%
%  Reference Element Q16:
%
%    |
%    1 13--14--15--16
%    |  |   :   :   |
%    |  |   :   :   |
%    |  9..10..11..12
%    S  |   :   :   |
%    |  |   :   :   |
%    |  5...6...7...8
%    |  |   :   :   |
%    |  |   :   :   |
%    0  1---2---3---4
%    |
%    +--0-----R-----1-->
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, S, the reference coordinates of a point.
%
%    Output, real T(16), the basis functions at the point.
%
%    Output, real DTDR(16), the R basis derivatives at the point.
%
%    Output, real DTDS(16), the S basis derivatives at the point.
%
  ra = r - 0.0;
  rb = r - 1.0 / 3.0;
  rc = r - 2.0 / 3.0;
  rd = r - 1.0;

  sa = s - 0.0;
  sb = s - 1.0 / 3.0;
  sc = s - 2.0 / 3.0;
  sd = s - 1.0;

  t(1)  =   (  81.0 / 4.0 ) * rb * rc * rd * sb * sc * sd;
  t(2)  = - ( 243.0 / 4.0 ) * ra * rc * rd * sb * sc * sd;
  t(3)  =   ( 243.0 / 4.0 ) * ra * rb * rd * sb * sc * sd;
  t(4)  = - (  81.0 / 4.0 ) * ra * rb * rc * sb * sc * sd;

  t(5)  = - ( 243.0 / 4.0 ) * rb * rc * rd * sa * sc * sd;
  t(6)  =   ( 729.0 / 4.0 ) * ra * rc * rd * sa * sc * sd;
  t(7)  = - ( 729.0 / 4.0 ) * ra * rb * rd * sa * sc * sd;
  t(8)  =   ( 243.0 / 4.0 ) * ra * rb * rc * sa * sc * sd;

  t(9)  =   ( 243.0 / 4.0 ) * rb * rc * rd * sa * sb * sd;
  t(10) = - ( 729.0 / 4.0 ) * ra * rc * rd * sa * sb * sd;
  t(11) =   ( 729.0 / 4.0 ) * ra * rb * rd * sa * sb * sd;
  t(12) = - ( 243.0 / 4.0 ) * ra * rb * rc * sa * sb * sd;

  t(13) = - (  81.0 / 4.0 ) * rb * rc * rd * sa * sb * sc;
  t(14) =   ( 243.0 / 4.0 ) * ra * rc * rd * sa * sb * sc;
  t(15) = - ( 243.0 / 4.0 ) * ra * rb * rd * sa * sb * sc;
  t(16) =   (  81.0 / 4.0 ) * ra * rb * rc * sa * sb * sc;

  dbcd = 3.0 * r * r -  4.0 * r       + 11.0 / 9.0;
  dacd = 3.0 * r * r - 10.0 * r / 3.0 +  2.0 / 3.0;
  dabd = 3.0 * r * r -  8.0 * r / 3.0 +  1.0 / 3.0;
  dabc = 3.0 * r * r -  2.0 * r       +  2.0 / 9.0;

  dtdr(1)  =   (  81.0 / 4.0 ) * dbcd * sb * sc * sd;
  dtdr(2)  = - ( 243.0 / 4.0 ) * dacd * sb * sc * sd;
  dtdr(3)  =   ( 243.0 / 4.0 ) * dabd * sb * sc * sd;
  dtdr(4)  = - (  81.0 / 4.0 ) * dabc * sb * sc * sd;
  dtdr(5)  = - ( 243.0 / 4.0 ) * dbcd * sa * sc * sd;
  dtdr(6)  =   ( 729.0 / 4.0 ) * dacd * sa * sc * sd;
  dtdr(7)  = - ( 729.0 / 4.0 ) * dabd * sa * sc * sd;
  dtdr(8)  =   ( 243.0 / 4.0 ) * dabc * sa * sc * sd;
  dtdr(9)  =   ( 243.0 / 4.0 ) * dbcd * sa * sb * sd;
  dtdr(10) = - ( 729.0 / 4.0 ) * dacd * sa * sb * sd;
  dtdr(11) =   ( 729.0 / 4.0 ) * dabd * sa * sb * sd;
  dtdr(12) = - ( 243.0 / 4.0 ) * dabc * sa * sb * sd;
  dtdr(13) = - (  81.0 / 4.0 ) * dbcd * sa * sb * sc;
  dtdr(14) =   ( 243.0 / 4.0 ) * dacd * sa * sb * sc;
  dtdr(15) = - ( 243.0 / 4.0 ) * dabd * sa * sb * sc;
  dtdr(16) =   (  81.0 / 4.0 ) * dabc * sa * sb * sc;

  dbcd = 3.0 * s * s -  4.0 * s       + 11.0 / 9.0;
  dacd = 3.0 * s * s - 10.0 * s / 3.0 +  2.0 / 3.0;
  dabd = 3.0 * s * s -  8.0 * s / 3.0 +  1.0 / 3.0;
  dabc = 3.0 * s * s -  2.0 * s       +  2.0 / 9.0;

  dtds(1)  =   (  81.0 / 4.0 ) * rb * rc * rd * dbcd;
  dtds(2)  = - ( 243.0 / 4.0 ) * ra * rc * rd * dbcd;
  dtds(3)  =   ( 243.0 / 4.0 ) * ra * rb * rd * dbcd;
  dtds(4)  = - (  81.0 / 4.0 ) * ra * rb * rc * dbcd;
  dtds(5)  = - ( 243.0 / 4.0 ) * rb * rc * rd * dacd;
  dtds(6)  =   ( 729.0 / 4.0 ) * ra * rc * rd * dacd;
  dtds(7)  = - ( 729.0 / 4.0 ) * ra * rb * rd * dacd;
  dtds(8)  =   ( 243.0 / 4.0 ) * ra * rb * rc * dacd;
  dtds(9)  =   ( 243.0 / 4.0 ) * rb * rc * rd * dabd;
  dtds(10) = - ( 729.0 / 4.0 ) * ra * rc * rd * dabd;
  dtds(11) =   ( 729.0 / 4.0 ) * ra * rb * rd * dabd;
  dtds(12) = - ( 243.0 / 4.0 ) * ra * rb * rc * dabd;
  dtds(13) = - (  81.0 / 4.0 ) * rb * rc * rd * dabc;
  dtds(14) =   ( 243.0 / 4.0 ) * ra * rc * rd * dabc;
  dtds(15) = - ( 243.0 / 4.0 ) * ra * rb * rd * dabc;
  dtds(16) =   (  81.0 / 4.0 ) * ra * rb * rc * dabc;

  return
end
