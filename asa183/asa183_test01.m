function asa183_test01 ( )

%*****************************************************************************80
%
%% ASA183_TEST01 tests R8_RANDOM.
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
  fprintf ( 1, 'ASA183_TEST01\n' );
  fprintf ( 1, '  R8_RANDOM computes pseudorandom values.\n' );
  fprintf ( 1, '  Three seeds, S1, S2, and S3, are used.\n' );

  s1 = 12345;
  s2 = 34567;
  s3 = 56789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '      R                 S1        S2        S3\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                  %8d  %8d  %8d\n', s1, s2, s3 );

  for i = 1 : 10
    [ r, s1, s2, s3 ] = r8_random ( s1, s2, s3 );
    fprintf ( 1, '  %14f  %8d  %8d  %8d\n', r, s1, s2, s3 );
  end

  return
end
