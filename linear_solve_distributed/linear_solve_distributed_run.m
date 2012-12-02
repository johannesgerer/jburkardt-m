%% LINEAR_SOLVE_DISTRIBUTED_RUN runs LINEAR_SOLVE_DISTRIBUTED.
%
%  Discussion:
%
%    The SPMD command is used, internally to the LINEAR_SOLVE_DISTRIBUTED 
%    function, to create a large array that is distributed across these 
%    machines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2009
%
%  Author:
%
%    John Burkardt
%

%
%  This command shuts off error messages from MATLAB that otherwise occur when
%  we use UNIX redirection to send an input file to MATLAB.
%
  warning ( 'off', 'all' )
%
%  Set the problems size.
%
  n = 1000;

  lab_num = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINEAR_SOLVE_DISTRIBUTED_RUN\n' );
  fprintf ( 1, '  Solve a distributed linear system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         N  LAB_NUM  Error  Time\n' );
  fprintf ( 1, '\n' );
%
%  Open the matlab pool.
%  To run on a cluster, replace 'local' by the appropriate job scheduler.
%
  if ( 0 < lab_num )
    matlabpool ( 'open', 'local', lab_num )
  end
%
%  Run the program, taking the wall clock time before and after.
%
  tic;

  x_error = linear_solve_distributed ( n );

  wtime = toc;
%
%  Finish up.
%
  if ( 0 < lab_num )
    matlabpool ( 'close' )
  end

  fprintf ( 1, '  %8d  %8d  %14e  %14f\n', n, lab_num, x_error, wtime );
