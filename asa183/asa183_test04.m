function asa183_test04 ( )

%*****************************************************************************80
%
%% ASA183_TEST04 tests R8_UNI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA183_TEST04\n' );
  fprintf ( 1, '  R8_UNI computes pseudorandom values.\n' );
  fprintf ( 1, '  Two seeds, S1 and S2, are used.\n' );

  s1 = 12345;
  s2 = 34567;

  fprintf ( 1, '\n' );
  fprintf ( 1, '      R                 S1        S2\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                  %8d  %8d\n', s1, s2 );

  for i = 1 : 10
    [ r, s1, s2 ] = r8_uni ( s1, s2 );
    fprintf ( 1, '  %14f  %8d  %8d\n', r, s1, s2 );
  end

  return
end
