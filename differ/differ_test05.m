function differ_test05 ( )

%*****************************************************************************80
%
%% DIFFER_TEST05 tests DIFFER_STENCIL.
%
%  Discussion:
%
%    Use DIFFER_STENCIL to reproduce forward, backward and central differences.
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
  fprintf ( 1, 'DIFFER_TEST05\n' );
  fprintf ( 1, '  DIFFER_STENCIL produces coefficients for difference\n' );
  fprintf ( 1, '  approximations of the O-th derivative, \n' );
  fprintf ( 1, '  using arbitrarily spaced data, with maximum spacing H\n' );
  fprintf ( 1, '  with error of order H^P.\n' );
%
%  Let X0 = 0.0;
%
  x0 = 0.0;
  h = 1.0;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For all tests, let X0 = %g\n', x0 );
  fprintf ( 1, '  and use a uniformly spacing of %g, so we can compare\n', h );
  fprintf ( 1, '  with previous forward, backward and central differences.\n' );
%
%  Forward difference approximation to the third derivative with error of O(h).
%
  o = 3;
  p = 1;
  n = o + p;
  x = ( 0 : n - 1 )' * h;
  c = differ_stencil ( x0, o, p, x );
  label = sprintf ( '  Finite difference coefficients, O = %d, P = %d', o, p );
  r8vec2_print ( n, x, c, label );
%
%  Backward difference approximation to the third derivative with error of O(h).
%
  o = 3;
  p = 1;
  n = o + p;
  x = ( 1 - n : 0 )' * h;
  c = differ_stencil ( x0, o, p, x );
  label = sprintf ( '  Backward difference coefficients, O = %d, P = %d', o, p );
  r8vec2_print ( n, x, c, label );
%
%  Central difference approximation to the third derivative with error of O(h^2).
%
  o = 3;
  p = 2;
  n = o + p;
  x = ( - n + 1 : 2 : n - 1 )' * h / 2.0;
  c = differ_stencil ( x0, o, p, x );
  label = sprintf ( '  Central difference coefficients, O = %d, P = %d', o, p );
  r8vec2_print ( n, x, c, label );
%
%  Central difference approximation to the third derivative with error of O(h^4).
%
  o = 3;
  p = 4;
  n = o + p;
  x = ( - n + 1 : 2 : n - 1 )' * h / 2.0;
  c = differ_stencil ( x0, o, p, x );
  label = sprintf ( '  Central difference coefficients, O = %d, P = %d', o, p );
  r8vec2_print ( n, x, c, label );
%
%  Forward difference approximation to the fourth derivative with error of O(h).
%
  o = 4;
  p = 1;
  n = o + p;
  x = ( 0 : n - 1 )' * h;
  c = differ_stencil ( x0, o, p, x );
  label = sprintf ( '  Finite difference coefficients, O = %d, P = %d', o, p );
  r8vec2_print ( n, x, c, label );
%
%  Backward difference approximation to the fourth derivative with error of O(h).
%
  o = 4;
  p = 1;
  n = o + p;
  x = ( 1 - n : 0 )' * h;
  c = differ_stencil ( x0, o, p, x );
  label = sprintf ( '  Backward difference coefficients, O = %d, P = %d', o, p );
  r8vec2_print ( n, x, c, label );
%
%  Central difference approximation to the fourth derivative with error of O(h^3).
%
  o = 4;
  p = 3;
  n = o + p;
  x = ( - n + 1 : 2 : n - 1 )' * h / 2.0;
  c = differ_stencil ( x0, o, p, x );
  label = sprintf ( '  Central difference coefficients, O = %d, P = %d', o, p );
  r8vec2_print ( n, x, c, label );

  return
end

