function subpak_test069 ( )

%*****************************************************************************80
%
%% TEST069 tests R8MAT_L_PRINT.
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
  a1(1:28) = [ ...
    11.0, 21.0, 31.0, 41.0, 51.0, 61.0, 71.0, ...
          22.0, 32.0, 42.0, 52.0, 62.0, 72.0, ...
                33.0, 43.0, 53.0, 63.0, 73.0, ...
                      44.0, 54.0, 64.0, 74.0, ...
                            55.0, 65.0, 75.0, ...
                                  66.0, 76.0, ...
                                        77.0 ];
  a2(1:18) = [ ...
    11.0, 21.0, 31.0, 41.0, 51.0, 61.0, 71.0, ...
          22.0, 32.0, 42.0, 52.0, 62.0, 72.0, ...
                33.0, 43.0, 53.0, 63.0, 73.0 ];
  a3(1:10) = [ ...
    11.0, 21.0, 31.0, 41.0, ...
          22.0, 32.0, 42.0, ...
                33.0, 43.0, ...
                      44.0 ];
  m1 = 7;
  m2 = 7;
  m3 = 4;
  n1 = 7;
  n2 = 3;
  n3 = 7;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST069\n' );
  fprintf ( 1, '  R8MAT_L_PRINT prints a lower triangular matrix\n' );
  fprintf ( 1, '  stored compactly.  Only the (possibly) nonzero\n' );
  fprintf ( 1, '  elements are printed.\n' );

  r8mat_l_print ( m1, n1, a1, '  A 7 by 7 matrix.' );

  r8mat_l_print ( m2, n2, a2, '  A 7 by 3 matrix.' );

  r8mat_l_print ( m3, n3, a3, '  A 4 by 7 matrix.' );

  return
end
