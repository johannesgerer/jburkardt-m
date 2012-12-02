function task_division ( task_number, proc_first, proc_last )

%*****************************************************************************80
%
%% TASK_DIVISION divides tasks among processors.
%
%  Discussion:
%
%    This routine assigns each of T tasks to P processors, assuming that
%    the assignment is to be beforehand.
%
%    In that case, we just want to make sure that we assign each task
%    to a processor, that we assign about the same number of tasks
%    to each processor, and that we assign each processor a contiguous
%    range of tasks, say tasks I_LO to I_HI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TASK_NUMBER, the number of tasks.
%
%    Input, integer PROC_FIRST, PROC_LAST, the first and last processors.
%
  p = proc_last + 1 - proc_first;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TASK_DIVISION\n' );
  fprintf ( 1, '  Divide T tasks among P processors.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of tasks T = %d\n', task_number );
  fprintf ( 1, '  Number of processors P = %d\n', p );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  P_FIRST = %d\n', proc_first );
  fprintf ( 1, '  P_LAST =  %d\n', proc_last );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             Number of   First      Last\n' );
  fprintf ( 1, ' Processor     Tasks     Task       Task\n' );
  fprintf ( 1, '\n' );

  i_hi = 0;

  task_remain = task_number;
  proc_remain = p;

  for proc = proc_first : proc_last

    task_proc = i4_div_rounded ( task_remain, proc_remain );

    proc_remain = proc_remain - 1;
    task_remain = task_remain - task_proc;

    i_lo = i_hi + 1;
    i_hi = i_hi + task_proc;

    fprintf ( 1, '  %8d  %8d  %8d  %8d\n', proc, task_proc, i_lo, i_hi );

  end

  return
end
