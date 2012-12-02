function asa183_test03 ( )

%*****************************************************************************80
%
%% ASA183_TEST03 tests R8_RANDOM.
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
  fprintf ( 1, 'ASA183_TEST03\n' );
  fprintf ( 1, '  Show how the seeds used by R8_RANDOM,\n' );
  fprintf ( 1, '  which change on each step, can be reset to\n' );
  fprintf ( 1, '  restore any part of the sequence.\n' );

  s1_save = 12345;
  s2_save = 34567;
  s3_save = 56789;

  s1 = s1_save;
  s2 = s2_save;
  s3 = s3_save;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Begin sequence with following seeds:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  S1 = %d\n', s1 );
  fprintf ( 1, '  S2 = %d\n', s2 );
  fprintf ( 1, '  S3 = %d\n', s3 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         I      R                 S1        S2        S3\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ r, s1, s2, s3 ] = r8_random ( s1, s2, s3 );
    fprintf ( 1, '  %8d  %14f  %8d  %8d  %8d\n', i, r, s1, s2, s3 );

    if ( i == 5 )
      s1_save = s1;
      s2_save = s2;
      s3_save = s3;
    end

  end

  s1 = s1_save;
  s2 = s2_save;
  s3 = s3_save;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Restart the sequence, using the seeds\n' );
  fprintf ( 1, '  produced after step 5:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         I      R                 S1        S2        S3\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ r, s1, s2, s3 ] = r8_random ( s1, s2, s3 );
    fprintf ( 1, '  %8d  %14f  %8d  %8d  %8d\n', i, r, s1, s2, s3 );

  end

  return
end
