function wathen_test ( )

%*****************************************************************************80
%
%% WATHEN_TEST tests WATHEN.
%
%  Modified:
%
%    24 March 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WATHEN_TEST:\n' );
  fprintf ( 1, '  WATHEN generates a Wathen finite element matrix.\n' );

  nx = 3;
  ny = 2;
  k = 0;

  a = wathen ( nx, ny, k );
  n = size ( a, 1 );

  r8mat_print ( n, n, a, '  The Wathen matrix:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'WATHEN_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end

