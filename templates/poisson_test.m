function poisson_test ( )

%*****************************************************************************80
%
%% POISSON_TEST tests POISSON.
% 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POISSON_TEST:\n' );
  fprintf ( 1, '  POISSON generates a Poisson matrix.\n' );

  n = 4;
  n2 = n * n;

  a = poisson ( n );

  r8mat_print ( n2, n2, a, '  The Poisson matrix:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POISSON_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );


  return
end
