function [ t, dtdr, dtds ] = shape_q12 ( r, s )

%*****************************************************************************80
%
%% SHAPE_Q12 evaluates shape functions for a 12 node reference quadrilateral.
%
%  Reference Element Q12:
%
%    |
%    1  9-10-11-12
%    |  |        |
%    |  7        8
%    S  |        |
%    |  5        6
%    |  |        |
%    0  1--2--3--4
%    |
%    +--0---R---1-->
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
%    Output, real T(12), the basis functions at the point.
%
%    Output, real DTDR(12), the R basis derivatives at the point.
%
%    Output, real DTDS(12), the S basis derivatives at the point.
%
  a = 0.0;
  b = 1.0 / 3.0;
  c = 2.0 / 3.0;
  d = 1.0;

  corner = 9.0 * ( ...
      ( 2.0 * r - 1.0 ) * ( 2.0 * r - 1.0 ) ...
    + ( 2.0 * s - 1.0 ) * ( 2.0 * s - 1.0 ) ) - 10.0;

  t(1) =     0.125  * ( r - d ) * ( s - d ) * corner;
  t(2) =  - 13.5    * ( r - a ) * ( r - c ) * ( r - d ) * ( s - d );
  t(3) =    13.5    * ( r - a ) * ( r - b ) * ( r - d ) * ( s - d );
  t(4) =   - 0.125  * ( r - a ) * ( s - d ) * corner;
  t(5) =  - 13.5    * ( r - d ) * ( s - a ) * ( s - c ) * ( s - d );
  t(6) =    13.5    * ( r - a ) * ( s - a ) * ( s - c ) * ( s - d );
  t(7) =    13.5    * ( r - d ) * ( s - a ) * ( s - b ) * ( s - d );
  t(8) =  - 13.5    * ( r - a ) * ( s - a ) * ( s - b ) * ( s - d );
  t(9) =   - 0.125  * ( r - d ) * ( s - a ) * corner;
  t(10) =   13.5    * ( r - a ) * ( r - c ) * ( r - d ) * ( s - a );
  t(11) = - 13.5    * ( r - a ) * ( r - b ) * ( r - d ) * ( s - a );
  t(12) =    0.125  * ( r - a ) * ( s - a ) * corner;

  dcdr = 36.0 * ( 2.0 * r - 1.0 );

  dtdr(1) =  0.125 * ( s - d ) * ( ( r - d ) * dcdr + corner );
  dtdr(2) =  - 13.5 * ( s - d ) * ( 3.0 * r * r ...
    - 2.0 * ( a + c + d ) * r + a * c + c * d + d * a );
  dtdr(3) =    13.5 * ( s - d ) * ( 3.0 * r * r ...
    - 2.0 * ( a + b + d ) * r + a * b + b * d + d * a );
  dtdr(4) = - 0.125 * ( s - d ) * ( ( r - a ) * dcdr + corner );
  dtdr(5) = - 13.5 * ( s - a ) * ( s - c ) * ( s - d );
  dtdr(6) =   13.5 * ( s - a ) * ( s - c ) * ( s - d );
  dtdr(7) =   13.5 * ( s - a ) * ( s - b ) * ( s - d );
  dtdr(8) = - 13.5 * ( s - a ) * ( s - b ) * ( s - d );
  dtdr(9) = - 0.125 * ( s - a ) * ( ( r - d ) * dcdr + corner );
  dtdr(10) =   13.5 * ( s - a ) * ( 3.0 * r * r ...
    - 2.0 * ( a + c + d ) * r + a * c + c * d + d * a );
  dtdr(11) = - 13.5 * ( s - a ) * ( 3.0 * r * r ...
    - 2.0 * ( a + b + d ) * r + a * b + b * d + d * a );
  dtdr(12) = 0.125 * ( s - a ) * ( ( r - a ) * dcdr + corner );

  dcds = 36.0 * ( 2.0 * s - 1.0 );

  dtds(1) =  0.125 * ( r - d ) * ( corner + ( s - d ) * dcds );
  dtds(2) =  - 13.5 * ( r - a ) * ( r - c ) * ( r - d );
  dtds(3) =  13.5 * ( r - a ) * ( r - b ) * ( r - d );
  dtds(4) = - 0.125  * ( r - a ) * ( corner + ( s - d ) * dcds );
  dtds(5) =  - 13.5 * ( r - d ) * ( 3.0 * s * s ...
    - 2.0 * ( a + c + d ) * s + a * c + c * d + d * a );
  dtds(6) =  13.5 * ( r - a ) * ( 3.0 * s * s ...
    - 2.0 * ( a + c + d ) * s + a * c + c * d + d * a );
  dtds(7) =  13.5 * ( r - d ) * ( 3.0 * s * s ...
    - 2.0 * ( a + b + d ) * s + a * b + b * d + d * a );
  dtds(8) =  - 13.5 * ( r - a ) * ( 3.0 * s * s ...
    - 2.0 * ( a + b + d ) * s + a * b + b * d + d * a );
  dtds(9) =  - 0.125 * ( r - d ) * ( corner + ( s - a ) * dcds );
  dtds(10) = 13.5 * ( r - a ) * ( r - c ) * ( r - d );
  dtds(11) = - 13.5 * ( r - a ) * ( r - b ) * ( r - d );
  dtds(12) = 0.125 * ( r - a ) * ( corner + ( s - a ) * dcds );

  return
end
