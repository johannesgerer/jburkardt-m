function subpak_test32 ( )

%*****************************************************************************80
%
%% TEST32 tests TVEC_EVEN, TVEC_EVEN2 and TVEC_EVEN3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST32\n' );
  fprintf ( 1, '  For evenly spaced angles between 0 and 2*PI:\n' );
  fprintf ( 1, '  TVEC_EVEN\n' );
  fprintf ( 1, '  TVEC_EVEN2\n' );
  fprintf ( 1, '  TVEC_EVEN3\n' );

  nt = 4;

  t = tvec_even ( nt );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  TVEC_EVEN\n' );
  fprintf ( 1, '    NT = %d\n', nt );
  fprintf ( 1, '\n' );

  for i = 1 : nt
    fprintf ( 1, '    %f\n', t(i) );
  end

  nt = 4;

  t = tvec_even2 ( nt );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  TVEC_EVEN2\n' );
  fprintf ( 1, '    NT = %d\n', nt );
  fprintf ( 1, '\n' );

  for i = 1 : nt
    fprintf ( 1, '    %f\n', t(i) );
  end

  nt = 4;

  t = tvec_even3 ( nt );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  TVEC_EVEN3\n' );
  fprintf ( 1, '    NT = %d\n', nt );
  fprintf ( 1, '\n' );
  
  for i = 1 : nt
    fprintf ( 1, '    %f\n', t(i) );
  end

  return
end
