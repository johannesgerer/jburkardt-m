function latin_edge_test ( )

%*****************************************************************************80
%
%% LATIN_EDGE_TEST tests LATIN_EDGE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 April 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATIN_EDGE_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the LATIN_EDGE library.\n' );

  seed = 0;
  seed = get_seed ( seed );

  seed_save = seed;
  seed = latin_edge_test01 ( seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATIN_EDGE_TEST:\n' );
  fprintf ( 1, '  Repeat test with different seed than run 1.\n' );

  seed = latin_edge_test01 ( seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATIN_EDGE_TEST:\n' );
  fprintf ( 1, '  Repeat test with same seed as run 1.\n' );

  seed = seed_save;
  seed = latin_edge_test01 ( seed );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATIN_EDGE_PRB:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
