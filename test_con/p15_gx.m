function array = p15_gx ( )

%*****************************************************************************80
%
%% P15_GX returns the coefficients of the linear portion of the function.
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
%    Output, real ARRAY(6,7), the coefficients of the linear portion
%    of the function, which are sums of the inverses of resistances.
%
  s0 = 1.0 / 10.0;
  s1 = 1.0 / 39.0;
  s2 = 1.0 / 51.0;
  s3 = 1.0 / 10.0;
  s4 = 1.0 / 25.5;
  s5 = 1.0 / 1.0;
  s6 = 1.0 / 0.62;
  s7 = 1.0 / 13.0;
  s8 = 1.0 / 0.201;

  array(1:6,1:7) = 0.0;

  array(1,1) = + s0 + s1 + s2;
  array(1,2) =      - s1;
  array(1,3) = - s0;
  array(1,7) =           - s2;

  array(2,1) =      - s1;
  array(2,2) =      + s1 + s2;
  array(2,6) =                - s3;

  array(3,1) = - s0;
  array(3,3) = + s0                + s4;
  array(3,4) =                     - s4;

  array(4,3) =                     - s4;
  array(4,4) =                     + s4 + s5 + s6;
  array(4,5) =                          - s5;

  array(5,4) =                          - s5;
  array(5,5) =                          + s5      + s7;
  array(5,6) =                                    - s7;

  array(6,2) =                - s3;
  array(6,5) =                                    - s7;
  array(6,6) =                + s3                + s7 + s8;

  return
end
