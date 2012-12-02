%% SATISFY_POOL uses the MATLABPOOL command to run the SATISFY code.
%
%  Discussion:
%
%    Output printed by the function appears directly on the screen.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 May 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SATISFY_POOL:\n' );
  fprintf ( 1, '  Call SATISFY_FUN for 0/1 variable assignments that satisfy a formula.\n' );

  matlabpool open local 4

  tic
  solutions = satisfy_fun ( );
  toc

  matlabpool close

  [ solution_num, n ] = size ( solutions );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of variables was %d\n', n );
  fprintf ( 1, '  Number of solutions found was %d\n', solution_num );
  for i = 1 : solution_num
    fprintf ( 1, '  %2d:  ', i );
    for j = 1 : n
      fprintf ( 1, '%2d', solutions(i,j) );
    end
    fprintf ( 1, '\n' );
  end
