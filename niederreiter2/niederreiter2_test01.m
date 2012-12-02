function niederreiter2_test01 ( )

%*****************************************************************************80
%
%% NIEDERREITER2_TEST01 tests SETFLD2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 November 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NIEDERREITER2_TEST01\n' );
  fprintf ( 1, '  SETFLD2 returns the addition, multiplication, and\n' );
  fprintf ( 1, '  subtraction tables for base 2.\n' );

  [ add, mul, sub ] = setfld2 ( 0 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Addition table:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '+  0  1\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '0  %d  %d\n', add(1,1), add(1,2) );
  fprintf ( 1, '1  %d  %d\n', add(2,1), add(2,2) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Multiplication table:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '*  0  1\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '0  %d  %d\n', mul(1,1), mul(1,2) );
  fprintf ( 1, '1  %d  %d\n', mul(2,1), mul(2,2) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Subtraction table:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '-  0  1\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '0  %d  %d\n', sub(1,1), sub(1,2) );
  fprintf ( 1, '1  %d  %d\n', sub(2,1), sub(2,2) );

  return
end
