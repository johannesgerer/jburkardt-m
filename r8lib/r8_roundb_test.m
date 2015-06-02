function r8_roundb_test ( )

%*****************************************************************************80
%
%% R8_ROUNDB_TEST tests R8_ROUNDB.
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
  base = 3;
  x = pi;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_ROUNDB_TEST\n' );
  fprintf ( 1, '  R8_ROUNDB rounds a number to a\n' );
  fprintf ( 1, '  specified number of base BASE digits.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here, we will use BASE = %d\n', base );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test effect on PI:\n' );
  fprintf ( 1, '  X = %f\n', x );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  NPLACE  XROUND\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 20
    nplace = i;
    xround = r8_roundb ( base, nplace, x );
    fprintf ( 1, '  %8d  %f\n', i, xround );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Try with a negative base:\n' );
  x = 121.0;
  base = -3;
  nplace = 3;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Input quantity is X = %f\n', x );
  fprintf ( 1, '  to be rounded in base %d\n', base );

  for nplace = 1 : 5

    xround = r8_roundb ( base, nplace, x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Output value to %d places is %f\n', nplace, xround );

  end

  return
end
