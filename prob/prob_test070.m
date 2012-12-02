function prob_test070 ( )

%*****************************************************************************80
%
%% TEST070 tests FACTORIAL_STIRLING, I4_FACTORIAL;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST070\n' );
  fprintf ( 1, '  FACTORIAL_STIRLING computes Stirling''s\n' );
  fprintf ( 1, '    approximate factorial function;\n' );
  fprintf ( 1, '  I4_FACTORIAL evaluates the factorial function;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N      Stirling     N!\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 20
    value = factorial_stirling ( i );
    fprintf ( 1, '  %6d  %14f  %20d\n', i, value, i4_factorial ( i ) );
  end

  return
end
