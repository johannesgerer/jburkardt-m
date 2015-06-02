function differ_test04 ( )

%*****************************************************************************80
%
%% DIFFER_TEST04 tests DIFFER_FORWARD, DIFFER_BACKWARD, DIFFER_CENTRAL.
%
%  Discussion:
%
%    Evaluate the coefficients for uniformly spaced finite difference
%    approximations of derivatives.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 November 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIFFER_TEST04\n' );
  fprintf ( 1, '  DIFFER_FORWARD,\n' );
  fprintf ( 1, '  DIFFER_BACKWARD, and\n' );
  fprintf ( 1, '  DIFFER_CENTRAL produce coefficients for difference\n' );
  fprintf ( 1, '  approximations of the O-th derivative, \n' );
  fprintf ( 1, '  with error of order H^P, for a uniform spacing of H.\n' );

  h = 1.0;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use a spacing of H = %g for all examples.\n', h );
%
%  Forward difference approximation to the third derivative with error of O(h).
%
  o = 3;
  p = 1;
  n = o + p;
  [ c, x ] = differ_forward ( h, o, p );
  label = sprintf ( '  Forward difference coefficients, O = %d, P = %d', o, p );
  r8vec2_print ( n, x, c, label );
%
%  Backward difference approximation to the third derivative with error of O(h).
%
  o = 3;
  p = 1;
  n = o + p;
  [ c, x ] = differ_backward ( h, o, p );
  label = sprintf ( '  Backward difference coefficients, O = %d, P = %d', o, p );
  r8vec2_print ( n, x, c, label );
%
%  Central difference approximation to the third derivative with error of O(h^2).
%
  o = 3;
  p = 2;
  n = o + p;
  [ c, x ] = differ_central ( h, o, p );
  label = sprintf ( '  Central difference coefficients, O = %d, P = %d', o, p );
  r8vec2_print ( n, x, c, label );
%
%  Central difference approximation to the third derivative with error of O(h^4).
%
  o = 3;
  p = 4;
  n = o + p;
  [ c, x ] = differ_central ( h, o, p );
  label = sprintf ( '  Central difference coefficients, O = %d, P = %d', o, p );
  r8vec2_print ( n, x, c, label );
%
%  Forward difference approximation to the fourth derivative with error of O(h).
%
  o = 4;
  p = 1;
  n = o + p;
  [ c, x ] = differ_forward ( h, o, p );
  label = sprintf ( '  Forward difference coefficients, O = %d, P = %d', o, p );
  r8vec2_print ( n, x, c, label );
%
%  Backward difference approximation to the fourth derivative with error of O(h).
%
  o = 4;
  p = 1;
  n = o + p;
  [ c, x ] = differ_backward ( h, o, p );
  label = sprintf ( '  Backward difference coefficients, O = %d, P = %d', o, p );
  r8vec2_print ( n, x, c, label );
%
%  Central difference approximation to the fourth derivative with error of O(h^3).
%
  o = 4;
  p = 3;
  n = o + p;
  [ c, x ] = differ_central ( h, o, p );
  label = sprintf ( '  Central difference coefficients, O = %d, P = %d', o, p );
  r8vec2_print ( n, x, c, label );

  return
end

