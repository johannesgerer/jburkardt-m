function lehmer_test ( )

%*****************************************************************************80
%
%% LEHMER_TEST tests LEHMER.
% 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEHMER_TEST:\n' );
  fprintf ( 1, '  LEHMER generates a Lehmer matrix.\n' );

  n = 10;

  a = lehmer ( n );

  r8mat_print ( n, n, a, '  The Lehmer matrix:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEHMER_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
