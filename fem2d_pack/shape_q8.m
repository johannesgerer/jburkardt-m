function [ t, dtdr, dtds ] = shape_q8 ( r, s )

%*****************************************************************************80
%
%% SHAPE_Q8 evaluates shape functions for an 8 node reference quadrilateral.
%
%  Discussion:
%
%    This element is known as the "serendipity" element.
%
%  Reference Element Q8:
%
%    |
%    1  4--7--3
%    |  |     |
%    |  |     |
%    S  8     6
%    |  |     |
%    |  |     |
%    0  1--5--2
%    |
%    +--0--R--1-->
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
%    Output, real T(8), the basis functions at the point.
%
%    Output, real DTDR(8), the R basis derivatives at the point.
%
%    Output, real DTDS(8), the S basis derivatives at the point.
%
  t(1) = ( r - 1.0 ) * ( s - 1.0 ) * ( 1.0 - 2.0 * r - 2.0 * s );
  t(2) = r * ( s - 1.0 ) * ( 1.0 - 2.0 * r + 2.0 * s );
  t(3) = r * s * ( 2.0 * r + 2.0 * s - 3.0 );
  t(4) =   ( r - 1.0 ) * s * ( 2.0 * r - 2.0 * s + 1.0 );
  t(5) =   4.0 * r * ( r - 1.0 ) * ( s - 1.0 );
  t(6) = - 4.0 * r * s * ( s - 1.0 );
  t(7) = - 4.0 * r * ( r - 1.0 ) * s;
  t(8) =   4.0 *     ( r - 1.0 ) * s * ( s - 1.0 );

  dtdr(1) = ( s - 1.0 ) * ( - 4.0 * r - 2.0 * s + 3.0 );
  dtdr(2) = ( s - 1.0 ) * ( - 4.0 * r + 2.0 * s + 1.0 );
  dtdr(3) =   s         * (   4.0 * r + 2.0 * s - 3.0 );
  dtdr(4) =   s         * (   4.0 * r - 2.0 * s - 1.0 );
  dtdr(5) =   4.0 * ( 2.0 * r - 1.0 )     * ( s - 1.0 );
  dtdr(6) = - 4.0 *                     s * ( s - 1.0 );
  dtdr(7) = - 4.0 * ( 2.0 * r - 1.0 ) * s;
  dtdr(8) =   4.0 *                     s * ( s - 1.0 );

  dtds(1) = ( r - 1.0 ) * ( - 4.0 * s - 2.0 * r + 3.0 );
  dtds(2) =   r *       (   4.0 * s - 2.0 * r - 1.0 );
  dtds(3) =   r *       (   4.0 * s + 2.0 * r - 3.0 );
  dtds(4) = ( r - 1.0 ) * ( - 4.0 * s + 2.0 * r + 1.0 );
  dtds(5) =   4.0 * r * ( r - 1.0 );
  dtds(6) = - 4.0 * r               * ( 2.0 * s - 1.0 );
  dtds(7) = - 4.0 * r * ( r - 1.0 );
  dtds(8) =   4.0 *     ( r - 1.0 ) * ( 2.0 * s - 1.0 );

  return
end
