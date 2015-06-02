function fem1d_spectral_symbolic_test ( )

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_SPECTRAL_SYMBOLIC_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the FEM1D_SPECTRAL_SYMBOLIC library.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Run FEM1D_SPECTRAL_SYMBOLIC with an increasing number of basis functions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N    L2-error   H1-error\n' );
  fprintf ( 1, '\n' );

  for n = 1 : 2 : 11
    [ l2, h1 ] = fem1d_spectral_symbolic ( n );
    fprintf ( 1, '  %2d  %14.6g  %14.6g\n', n, l2, h1 );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_SPECTRAL_SYMBOLIC_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end

