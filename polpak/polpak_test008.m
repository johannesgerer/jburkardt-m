function polpak_test008 ( )

%*****************************************************************************80
%
%% TEST008 tests BENFORD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST008\n' );
  fprintf ( 1, '  BENFORD(I) is the Benford probability of the\n' );
  fprintf ( 1, '  initial digit sequence I.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I     BENFORD(I)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 9
    fprintf ( 1, '  %2d  %12f\n', i, benford(i) );
  end
 
  return
end
