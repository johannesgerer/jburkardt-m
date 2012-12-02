function bisection_integer_test01 ( )

%*****************************************************************************80
%
%% BISECTION_INTEGER_TEST01 tests BISECTION_INTEGER;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 August 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BISECTION_INTEGER_TEST01\n' );
  fprintf ( 1, '  BISECTION_INTEGER attempts to locate an integer root C\n' );
  fprintf ( 1, '  of an equation F(C) = 0.\n' );
  fprintf ( 1, '  The user supplies a change of sign interval [A,B].\n' );
  fprintf ( 1, '  The function considered here has two real roots\n' );
  fprintf ( 1, '  as well as an integer root, so the algorithm can\n' );
  fprintf ( 1, '  fail depending on how the change of sign interval is chosen.\n' );

  a = 4;
  b = 100;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial change of sign interval is:\n' );
  fprintf ( 1, '  F(%d) = %d\n', a, f01 ( a ) );
  fprintf ( 1, '  F(%d) = %d\n', b, f01 ( b ) );

  [ c, fc ] = bisection_integer ( @f01, a, b );

  if ( fc == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  An exact root was found at C = %d\n', c );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  An exact root was NOT found.\n' );
    fprintf ( 1, '  The change of sign interval is now:\n' );
    fprintf ( 1, '  F(%d) = %d\n', a, f01 ( a ) );
    fprintf ( 1, '  F(%d) = %d\n', b, f01 ( b ) );
  end

  a = -10;
  b = 15;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial change of sign interval is:\n' );
  fprintf ( 1, '  F(%d) = %d\n', a, f01 ( a ) );
  fprintf ( 1, '  F(%d) = %d\n', b, f01 ( b ) );

  [ c, fc ] = bisection_integer ( @f01, a, b );

  if ( fc == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  An exact root was found at C = %d\n', c );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  An exact root was NOT found.\n' );
    fprintf ( 1, '  The change of sign interval is now:\n' );
    fprintf ( 1, '  F(%d) = %d\n', a, f01 ( a ) );
    fprintf ( 1, '  F(%d) = %d\n', b, f01 ( b ) );
  end

  return
end
