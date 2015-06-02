function floyd_test03 ( )

%*****************************************************************************80
%
%% FLOYD_TEST03 applies Floyd's algorithm to matrices of increasing size.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1,'FLOYD_TEST03\n' );
  fprintf ( 1, '  Test I4MAT_FLOYD on the MOD(I,J) matrix.\n' );
  fprintf ( 1, '  The work is roughly N^3.\n' );
  fprintf ( 1, '\n');
  fprintf ( 1, '         N   Time (seconds)  Time/N^3\n' );
  fprintf ( 1, '\n' );

  n = 1;
  while ( n <= 512 )
    wtime = floyd_test03_sub ( n );
    fprintf ( 1, '  %8d  %12f  %12f\n', n, wtime, 1000000 * wtime / n^3 );
    n = n * 2;
  end

  return
end
