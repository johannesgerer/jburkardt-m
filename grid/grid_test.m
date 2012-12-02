function grid_test ( )

%*****************************************************************************80
%
%% GRID_TEST tests the grid routines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GRID_PRB:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the GRID library.\n' );

  center = 1;
  seed = 123456789;

  grid_test01 ( center, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Repeat TEST01 with a different seed from the first run.\n' );

  seed = 987654321;
  grid_test01  ( center, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Repeat TEST01 with the same seed as the first run.\n' );

  seed = 123456789;
  grid_test01  ( center, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Repeat TEST01 with different centering values.\n' );

  for center = 1 : 5

    seed = 123456789;
    grid_test01  ( center, seed );

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GRID_PRB:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

