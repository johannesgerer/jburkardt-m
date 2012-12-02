function [ t, dtdr, dtds ] = shape_ql ( r, s )

%*****************************************************************************80
%
%% SHAPE_QL evaluates shape functions for a 6 node quadratic/linear.
%
%  Reference Element QL:
%
%    |
%    1  4--5--6
%    |  |     |
%    |  |     |
%    S  |     |
%    |  |     |
%    |  |     |
%    0  1--2--3
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
%    Output, real T(6), the basis functions at the point.
%
%    Output, real DTDR(6), the R basis derivatives at the point.
%
%    Output, real DTDS(6), the S basis derivatives at the point.
%
  t(1) = - 2.0 *     ( r - 0.5 ) * ( r - 1.0 )     * ( s - 1.0 );
  t(2) =   4.0 * r               * ( r - 1.0 )     * ( s - 1.0 );
  t(3) = - 2.0 * r * ( r - 0.5 )                   * ( s - 1.0 );
  t(4) =   2.0 *     ( r - 0.5 ) * ( r - 1.0 ) * s;
  t(5) = - 4.0 * r               * ( r - 1.0 ) * s;
  t(6) =   2.0 * r * ( r - 0.5 )               * s;

  dtdr(1) = 2.0 * ( - 2.0 * r + 1.5 )     * ( s - 1.0 );
  dtdr(2) = 4.0 * (   2.0 * r - 1.0 )     * ( s - 1.0 );
  dtdr(3) = 2.0 * ( - 2.0 * r + 0.5 )     * ( s - 1.0 );
  dtdr(4) = 2.0 * (   2.0 * r - 1.5 ) * s;
  dtdr(5) = 4.0 * ( - 2.0 * r + 1.0 ) * s;
  dtdr(6) = 2.0 * (   2.0 * r - 0.5 ) * s;

  dtds(1) = - 2.0 *     ( r - 0.5 ) * ( r - 1.0 );
  dtds(2) =   4.0 * r               * ( r - 1.0 );
  dtds(3) = - 2.0 * r * ( r - 0.5 );
  dtds(4) =   2.0 *     ( r - 0.5 ) * ( r - 1.0 );
  dtds(5) = - 4.0 * r               * ( r - 1.0 );
  dtds(6) =   2.0 * r * ( r - 0.5 );

  return
end
