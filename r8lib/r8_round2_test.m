function r8_round2_test ( )

%*****************************************************************************80
%
%% R8_ROUND2_TEST tests R8_ROUND2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  x = pi;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_ROUND2_TEST\n' );
  fprintf ( 1, '  R8_ROUND2 rounds a number to a\n' );
  fprintf ( 1, '  specified number of base 2 digits.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test effect on PI:\n' );
  fprintf ( 1, '  X = %f\n', x );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  NPLACE  XROUND\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 20
    nplace = i;
    xround = r8_round2 ( nplace, x );
    fprintf ( 1, '  %8d  %f\n', i, xround );
  end

  return
end
