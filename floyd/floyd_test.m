function floyd_test ( )

%*****************************************************************************80
%
%% MAIN is the main program for FLOYD_TEST.
%
%  Discussion:
%
%    FLOYD_TEST calls a set of problems for FLOYD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 May 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FLOYD_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the FLOYD library.\n' );

  floyd_test01 ( );
  floyd_test02 ( );

  fprintf ( 1, '\n' );
  fprintf ( 1,'FLOYD_TEST03\n' );
  fprintf ( 1, '  Test I4MAT_FLOYD on the MOD(I,J) matrix.\n' );
  fprintf ( 1, '  The work is roughly N^3.\n' );
  fprintf ( 1, '\n');
  fprintf ( 1, '         N   Time (seconds)  Time/N^3\n' );
  fprintf ( 1, '\n' );

  n = 1;
  while ( n <= 512 )
    wtime = floyd_test03 ( n );
    fprintf ( 1, '  %8d  %12f  %12f\n', n, wtime, 1000000 * wtime / n^3 );
    n = n * 2;
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FLOYD_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
